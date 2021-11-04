//
//  AlamofireVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/10/29.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit
import Alamofire
class AlamofireVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Alamofire"
        self.view.backgroundColor = UIColor.white
        //1.Alamofire的网络是否联通和连接方式
        networkStatue()
        //2.GET和POST请求
        addGetBtn()
        addPostBtn()
        //3.文件上传及进度显示
        addUploadBtn()
        //4.文件下载及进度显示
        addDownloadBtn()
    }
    
    //1.Alamofire的网络是否联通和连接方式
    @objc func networkStatueClick(){
                let manager = NetworkReachabilityManager.init()
                
        manager?.listener = {status in
            switch status {

               case .reachable(.ethernetOrWiFi):
                   print("The network is reachable over the WiFi connection")

               case .reachable(.wwan):
                   print("The network is reachable over the WWAN connection")

               case .notReachable:
                   print("The network is not reachable")

               case .unknown :
                   print("It is unknown whether the network is reachable")

               }
        }
       
        manager?.startListening()
    }
    //2.GET和POST请求
    @objc func getRequest(){
        self.responseTextView.text = nil
        Alamofire.request(WW_showChart_Get_Url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
        
            do{
                let data = try JSONSerialization.jsonObject(with: response.data!, options:.mutableContainers) as AnyObject
                debugPrint(data)
            }catch{
                print(error)
            }
        }
    }

    @objc func postRequest(){
        let headers : HTTPHeaders = [
            "Content-Type":"application/json"
        ]
//        areas = LB;
//        channelId = B06022853001;
//        isWholeSale = 1;
        let param = ["channelId":"B06022853001"]
   
        //POST
        Alamofire.request(WW_CategoryList_Url, method: .post, parameters: param, encoding: JSONEncoding.default, headers: headers).responseJSON {response in
            
            debugPrint(response)
        }
    }
    //3.文件上传及进度显示
    @objc func uploadRequest(){
        
        let image : UIImage = UIImage.init(named: "灌篮高手3")!
        let data : Data = UIImageJPEGRepresentation(image, 0.8)!//JEPG
//        UIImagePNGRepresentation(image) PNG
        let param = ["orderCode":"21102110121699"]
      
        Alamofire.upload(multipartFormData: { multipartFormData in
            //图片
            let formatter = DateFormatter.init()
            formatter.dateFormat = "yyyyMMddHHmmss"
            let dateString = formatter.string(from: Date())
            let fileName = dateString + "0"//日期+图片数组索引 这里一张默认0
            multipartFormData.append(data, withName: "files", fileName: fileName, mimeType: "image/jpeg")
            //传参
            let value : String = param["orderCode"]!
            let vData : Data = value.data(using: .utf8)!
            multipartFormData.append(vData, withName: "orderCode")
            
            
            //拼接多参数
//            for (key, value) in param {
//                multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
//            }
        }, to: WW_uploadImage_Url) { encodingResult in
            
            switch encodingResult{
                
                case .success(request: let request,_,_):
                    //上传进度回调
                    request.uploadProgress { progress in
                        debugPrint(progress)
                    }
                    //上传结果回调
                    request.responseJSON { response in
                        debugPrint(response)
                    }
                case .failure(let encodingError):
                    debugPrint(encodingError)
            }
        }
        
    }
    //4.文件下载及进度显示
    @objc func downloadRequest(){
//        var resumeData : Data

        let des = DownloadRequest.suggestedDownloadDestination(for: .documentDirectory, in: .userDomainMask)
        Alamofire.download("https://hotkidceo-1251330842.file.myqcloud.com/2021063013572601348.jpg",to: des).downloadProgress { progress in
            print("Download Progress: \(progress.fractionCompleted)")
        }
        .responseData { response in
            if(response.destinationURL != nil){//读取本地图片
                print(response.destinationURL?.path as Any)
                let str =   response.destinationURL!.path
                let image = UIImage.init(contentsOfFile: str)
                self.downLoadImageView.image = image
            }else{
                if let data = response.value {//下载成功 data获取图片
                    let image = UIImage(data: data )
                    self.downLoadImageView.image = image
                }
            }
        }
        
//        download.task?.cancel()
        
//        Alamofire.download(resumingWith: resumeData).responseData { response in
//            if let data = response.value {
//                let image = UIImage(data: data)
//            }
//        }
    }
    
    
    //MARK:UI
    func addGetBtn(){
        self.view.addSubview(self.getRequestBtn)
        self.getRequestBtn.snp.makeConstraints {
            $0.width.height.equalTo(120)
            $0.left.top.equalTo(self.view).offset(80)
        }
        
        self.view.addSubview(self.responseTextView)
        self.responseTextView.snp.makeConstraints {
            $0.left.right.bottom.equalTo(self.view)
            $0.height.equalTo(200);
        }
    }
    func addPostBtn(){
        self.view.addSubview(self.postRequestBtn)
        self.postRequestBtn.snp.makeConstraints {
            $0.width.height.equalTo(120)
            $0.right.equalTo(self.view).offset(-80)
            $0.top.equalTo(self.view).offset(80)
        }
    }
    func addUploadBtn(){
        self.view.addSubview(self.uploadRequestBtn)
        self.uploadRequestBtn.snp.makeConstraints {
            $0.top.equalTo(self.getRequestBtn.snp_bottom).offset(30)
            $0.centerX.equalTo(self.getRequestBtn)
        }
    }
    func addDownloadBtn(){
        self.view.addSubview(self.downloadRequestBtn)
        self.downloadRequestBtn.snp.makeConstraints {
            $0.top.equalTo(self.postRequestBtn.snp_bottom).offset(30)
            $0.centerX.equalTo(self.postRequestBtn)
        }
        
        self.view.addSubview(self.downLoadImageView)
        self.downLoadImageView.snp.makeConstraints {
            $0.top.equalTo(self.netWorkReachabilityBtn.snp_bottom)
            $0.width.height.equalTo(100)
            $0.centerX.equalTo(self.view)
        }
    }
    func networkStatue(){
        self.view.addSubview(self.netWorkReachabilityBtn)
        self.netWorkReachabilityBtn.snp.makeConstraints {
            $0.center.equalTo(self.view)
        }
    }
    lazy var getRequestBtn : UIButton = {
      let getRequestBtn = UIButton()
        getRequestBtn.setTitle("GETRequest", for: .normal)
        getRequestBtn.setTitleColor(.black, for: .normal)
        getRequestBtn.addTarget(self, action: #selector(getRequest), for: .touchUpInside)
        return getRequestBtn
    }()
    
    lazy var postRequestBtn : UIButton = {
      let postRequestBtn = UIButton()
        postRequestBtn.setTitle("POSTRequest", for: .normal)
        postRequestBtn.setTitleColor(.black, for: .normal)
        postRequestBtn.addTarget(self, action: #selector(postRequest), for: .touchUpInside)
        return postRequestBtn
    }()
    
    lazy var uploadRequestBtn : UIButton = {
      let uploadRequestBtn = UIButton()
        uploadRequestBtn.setTitle("uploadRequest", for: .normal)
        uploadRequestBtn.setTitleColor(.black, for: .normal)
        uploadRequestBtn.addTarget(self, action: #selector(uploadRequest), for: .touchUpInside)
        return uploadRequestBtn
    }()
    
    lazy var downloadRequestBtn : UIButton = {
      let downloadRequestBtn = UIButton()
        downloadRequestBtn.setTitle("dwonloadRequest", for: .normal)
        downloadRequestBtn.setTitleColor(.black, for: .normal)
        downloadRequestBtn.addTarget(self, action: #selector(downloadRequest), for: .touchUpInside)
        return downloadRequestBtn
    }()
    
    lazy var netWorkReachabilityBtn : UIButton = {
      let netWorkReachabilityBtn = UIButton()
        netWorkReachabilityBtn.setTitle("networkStatue", for: .normal)
        netWorkReachabilityBtn.setTitleColor(.black, for: .normal)
        netWorkReachabilityBtn.addTarget(self, action: #selector(networkStatueClick), for: .touchUpInside)
        return netWorkReachabilityBtn
    }()
    
    lazy var responseTextView : UITextView = {
       let responseTextView = UITextView()
        responseTextView.textColor = .black
        return responseTextView
    }()
    
    lazy var downLoadImageView : UIImageView = {
        let downLoadImageView = UIImageView()
        return downLoadImageView
    }()
}
