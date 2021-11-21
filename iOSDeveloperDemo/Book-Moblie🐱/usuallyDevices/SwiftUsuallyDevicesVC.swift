//
//  SwiftUsuallyDevicesVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/10/31.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit
import PhotosUI
//MARK：iOS 15 系统的 UIImagePickerController 适合单张选择 头像裁剪之类 简单功能
//PHPick 虽然可选多张 保护用户隐私 无裁剪，选择照片通过icould iCloud 大文件下载缺少进度信息  不如直接第三方
class SwiftUsuallyDevicesVC: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,PHPickerViewControllerDelegate{

    var pickImgaeVC : UIImagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
            title = "常用设备使用"
        //1.Photos and Camera 的使用
        makePhotosAndCameraUI()
        //1.1 读取Photos中的图片
        //1.2 调用相机拍摄功能
        
        //2.定位设备的使用
        //2.1 获取设备地理位置
        //2.2 地理坐标转换为实际地名

        
    }
    func makePhotosAndCameraUI(){
        view.addSubview(self.pickImageBtn)
        view.addSubview(self.pickCameraBtn)
        view.addSubview(self.animationImageView)
        view.addSubview(self.animationImageSecondView)
        view.addSubview(self.deviceLocationBtn)
        view.addSubview(self.deviceMotionBtn)
        self.pickImageBtn.snp.makeConstraints {
            $0.centerX.equalTo(self.view)
            $0.top.equalTo(self.view).offset(100)
            
        }
        self.pickCameraBtn.snp.makeConstraints {
            $0.centerX.equalTo(self.view)
            $0.top.equalTo(self.pickImageBtn.snp_bottom).offset(20)
        }
        
        self.animationImageView.snp.makeConstraints {
            $0.centerX.equalTo(self.view)
            $0.top.equalTo(self.pickCameraBtn.snp_bottom).offset(20)
            $0.width.height.equalTo(200)
        }
        self.animationImageSecondView.snp.makeConstraints {
            $0.centerX.equalTo(self.view)
            $0.top.equalTo(self.animationImageView.snp_bottom).offset(20)
            $0.width.height.equalTo(200)
        }
        self.deviceLocationBtn.snp.makeConstraints {
            $0.centerX.equalTo(self.view)
            $0.top.equalTo(self.animationImageSecondView.snp_bottom).offset(20)
        }
        self.deviceMotionBtn.snp.makeConstraints {
            $0.centerX.equalTo(self.view)
            $0.top.equalTo(self.deviceLocationBtn.snp_bottom).offset(20)
        }
    }
    @objc func pickImage(){
        self.pickImgaeVC.delegate = self
        self.pickImgaeVC.allowsEditing = true
        self.pickImgaeVC.sourceType = .photoLibrary //camera 打开相机
//        self.pickImgaeVC.sourceType = .camera
        self.pickImgaeVC.navigationBar.barTintColor = .orange
        self.pickImgaeVC.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        self.pickImgaeVC.navigationBar.tintColor = .white
        self.pickImgaeVC.allowsEditing = true //方框内正方形 截取
        
        self.present(self.pickImgaeVC, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        self.animationImageView.image = info["UIImagePickerControllerEditedImage"] as? UIImage
        self.dismiss(animated: true, completion: nil)
        /**
         ▿ 6 elements
           ▿ 0 : 2 elements
             - key : "UIImagePickerControllerMediaType"
             - value : public.image
           ▿ 1 : 2 elements
             - key : "UIImagePickerControllerReferenceURL"
             - value : assets-library://asset/asset.JPG?id=9F983DBA-EC35-42B8-8773-B597CF782EDD&ext=JPG
           ▿ 2 : 2 elements
             - key : "UIImagePickerControllerEditedImage"
             - value : <UIImage:0x600000f3c750 anonymous {1166, 778} renderingMode=automatic>
           ▿ 3 : 2 elements
             - key : "UIImagePickerControllerOriginalImage"
             - value : <UIImage:0x600000f12880 anonymous {3000, 2002} renderingMode=automatic>
           ▿ 4 : 2 elements
             - key : "UIImagePickerControllerCropRect"
             - value : NSRect: {{0, 0}, {3000, 2002}}
           ▿ 5 : 2 elements
             - key : "UIImagePickerControllerImageURL"
             - value : file:///Users/zoujie/Library/Developer/CoreSimulator/Devices/1C44DCCE-EAC6-4AE1-A938-945CE1ACF43A/data/Containers/Data/Application/07A63EF7-0EF3-422F-8C3A-54A38DFD9C42/tmp/7032D65E-1737-4BC8-BF7C-2B1E377CC4D1.jpeg
         */
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func pickHPickVC(){
        if #available(iOS 14, *) {
            var config = PHPickerConfiguration()
            // 可选择的资源数量，0表示不设限制，默认为1
            config.selectionLimit = 2
            // 可选择的资源类型
            // 只显示图片（注：images 包含 livePhotos）
            config.filter = .images
            // 显示 Live Photos 和视频（注：livePhotos 不包含 images）
            config.filter = .any(of: [.livePhotos, .videos])
            // 如果要获取视频，最好设置该属性，避免系统对视频进行转码
            config.preferredAssetRepresentationMode = .current

            let picker = PHPickerViewController(configuration: config)
            picker.delegate = self
            present(picker, animated: true, completion: nil)
        } else {
            // Fallback on earlier versions
        }
 
    }
    
    
    @available(iOS 14, *)
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
//        for result in results {
//            // 判断类型是否为 UIImage
//            if result.itemProvider.canLoadObject(ofClass: UIImage.self) {
//                // 确认类型后，调用 loadObject 方法获取图片
//                result.itemProvider.loadObject(ofClass: UIImage.self) { (data, error) in
//                    // 回调结果是在异步线程，展示时需要切换到主线程
//                    if let image = data as? UIImage {
//                        DispatchQueue.main.async {
//                            self.animationImageView.image = image
//                        }
//                    }
//                }
//            }
//        }
        if(results.count < 1){
            dismiss(animated: true, completion: nil)
        }
            
        let resultOne = results.first
        let resultTwo = results[1]
        
        resultOne?.itemProvider.loadObject(ofClass: UIImage.self, completionHandler: { data, error in
            if let image = data as? UIImage{
                DispatchQueue.main.async {
                    self.animationImageView.image = image
                }
            }
        })
        
        resultTwo.itemProvider.loadObject(ofClass: UIImage.self, completionHandler: { data, error in
            if let image = data as? UIImage{
                DispatchQueue.main.async {
                    self.animationImageSecondView.image = image
                }
            }
        })
        
        dismiss(animated: true, completion: nil)
    }
    
    
    lazy var animationImageView : UIImageView = {
        let animationImageView = UIImageView()
//        animationImageView.image = UIImage(named: "cornel_branch_tree")
        return animationImageView
    }()
    
    lazy var animationImageSecondView : UIImageView = {
        let animationImageSecondView = UIImageView()
//        animationImageView.image = UIImage(named: "cornel_branch_tree")
        return animationImageSecondView
    }()
    
    lazy var pickImageBtn : UIButton = {
        let pickImageBtn = UIButton()
        pickImageBtn.setTitle("选择pickVC", for: .normal)
        pickImageBtn.setTitleColor(.black, for: .normal)
        pickImageBtn.addTarget(self, action: #selector(SwiftUsuallyDevicesVC.pickImage), for: .touchUpInside)
        return pickImageBtn
    }()

    lazy var pickCameraBtn : UIButton = {
        let pickCameraBtn = UIButton()
        pickCameraBtn.setTitle("使用PHPickVC", for: .normal)
        pickCameraBtn.setTitleColor(.black, for: .normal)
        pickCameraBtn.addTarget(self, action: #selector(pickHPickVC), for: .touchUpInside)
        return pickCameraBtn
    }()
    
    lazy var deviceLocationBtn : UIButton = {
        let deviceLocationBtn = UIButton()
        deviceLocationBtn.setTitle("Device Location", for: .normal)
        deviceLocationBtn.setTitleColor(.black, for: .normal)
        deviceLocationBtn.addTarget(self, action: #selector(jumpDeviceLocation), for: .touchUpInside)
        return deviceLocationBtn
    }()
    
    
    @objc func jumpDeviceLocation(){
//        self.navigationController?.pushViewController(SwiftDeviceLocationVC(), animated: true)
     
        let detailController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "locationVC")//storyBoard ID
        self.navigationController?.pushViewController(detailController, animated: true)
//        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "modelVC")
//        self.present(vc, animated: true) {
//            
//        }
    }
    
    lazy var deviceMotionBtn : UIButton = {
        let deviceMotionBtn = UIButton()
        deviceMotionBtn.setTitle("DeviceMotionBtn", for: .normal)
        deviceMotionBtn.setTitleColor(.black, for: .normal)
        deviceMotionBtn.addTarget(self, action: #selector(jumpdeviceMotion), for: .touchUpInside)
        return deviceMotionBtn
    }()
    
    @objc func jumpdeviceMotion(){
                self.navigationController?.pushViewController(SwiftDeviceMotionVC(), animated: true)
    }
}
