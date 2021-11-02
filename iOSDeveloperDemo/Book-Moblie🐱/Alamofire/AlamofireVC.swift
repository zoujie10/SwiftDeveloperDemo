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
        self.view.backgroundColor = UIColor.white
        //1.Alamofire的网络是否联通和连接方式
        //2.GET和POST请求
        getAndPostRequest()
        //3.文件上传及进度显示
        //4.文件下载及进度显示
//        let alamoFireReuqest = Alamofire.request("www.baidu.com", method: .get, parameters: ["1"], encoding: nil, headers: nil)
    }
    
    //1.Alamofire的网络是否联通和连接方式
    //2.GET和POST请求
    func getAndPostRequest(){
        
        let headers : HTTPHeaders = [
//            "TOKEN":" .eyJkYXRhIjp7ImF1dGhJbmZvIjp7fSwiY2hhbm5lbElkIjoiQjA2MDIyODUzMDAxIiwiY3JlYXRlVGltZSI6MTYzNTgyNDgyOTM0NCwibWVtYmVyS2V5IjoiMTc3MDY4OTYiLCJzaWduIjoiMzQ5N2E4NDdjZDgxN2FiMDdjNjMwOTI2NDhlMTQwMzMifX0=.",
//            "User-Agent":"PostmanRuntime/7.24.0",
            "Content-Type":"application/json"
        ]

//        areas = LB;
//        channelId = B06022853001;
//        isWholeSale = 1;
        let param = ["channelId":"B06022853001"]
   
//        Alamofire.request("www.baidu.com").response{responses in
//            debugPrint(responses)
//        }

        Alamofire.request("http://dev-api.hotkidceo.com/appapi/root-ceo-commodity/categoryApi/categoryList", method: .post, parameters: param, encoding: URLEncoding.default, headers: headers).responseJSON {response in
            
            debugPrint(response.response?.allHeaderFields ?? "nil")
            debugPrint(response)
        }
    }
    //3.文件上传及进度显示
    //4.文件下载及进度显示
    
}
