//
//  SwiftImageAndVideoVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/10/23.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit
import CoreImage

class SwiftImageAndVideoVC: UIViewController {
    var clickIndex  = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "ImageAndVideo"
        //1.CoreImage <https://developer.apple.com/library/archive/documentation/GraphicsImaging/Conceptual/CoreImaging/ci_tasks/ci_tasks.html#//apple_ref/doc/uid/TP30001185-CH3-TPXREF101>
        /*
         1.使用内置的滤镜对图片进行快速的艺术处理和加工
         2.对人脸特征进行检测
         3.通过图像的直方图等信息进行画像色彩的自动增强
         4.同时使用多个滤镜以产生更加复杂多变的自定义效果
         5.创建运行在GPU上的自定义滤镜提高图像处理速度
         
         Processing Images:
         Processing images means applying filters—an image filter is a piece of software that examines an input image pixel by pixel and algorithmically applies some effect in order to create an output image. In Core Image, image processing relies on the CIFilter and CIImage classes, which describe filters and their input and output. To apply filters and display or export results, you can make use of the integration between Core Image and other system frameworks, or create your own rendering workflow with the CIContext class.
        
         CIFilter :进行图像处理的滤镜，每种滤镜都有不用的设置参数。每个滤镜对象至少拥有一个输入参数，并且产出一个输出图像。
         CIImage : CoreImage框架中的图像类型，可以使用CIImage读取一张照片作为输入图片，或者作为CIFilter的输出图片。
         CIContext :Core Image通过CIContext绘制有CIFilter处理后的结果。
         */
   
        
        //1.1 CoreImage制作单色调效果
//        coreImageMethod()
      
        //1.2 图片添加马赛克
//        coreImageMosaic()
        
        //1.3 处理视频画面
        
        //1.4 所有滤镜
//       coreImageAllFilter()
        
        //1.5 CIDetector CIFeature 人脸检测
//        CIDetectorAndCIFeature()
        
        //2.UIBlerEffect and CGBlendMode
        
        //2.1 毛玻璃效果
        
        //2.2 颜色混合效果
        
        
        self.view.addSubview(self.changeImageBtn)
        self.changeImageBtn.snp.makeConstraints {
            $0.center.equalTo(CGPoint.init(x: 100, y: 120))
            $0.width.equalTo(120)
            $0.height.equalTo(30)
        }
        self.view.addSubview(self.processVideoBtn)
        self.processVideoBtn.snp.makeConstraints {
            $0.centerY.equalTo(self.changeImageBtn)
            $0.left.equalTo(self.changeImageBtn.snp_right).offset(50)
        }
    }
    
    func coreImageMethod(){
        self.view.addSubview(self.orgImageView)
        self.orgImageView.snp.makeConstraints {
            $0.center.equalTo(self.view)
            $0.height.equalTo(330)
            $0.width.equalTo(220)
        }
//        let context = CIContext()
//        let filter = CIFilter.init(name: "CISepiaTone")!
//        filter.setValue(0.9, forKey: kCIInputIntensityKey)
//        let image = CIImage.init(image: self.orgImageView.image!)
//        filter.setValue(image, forKey: kCIInputImageKey)
//        let result = filter.outputImage!
//        let cgImage = context.createCGImage(result, from: result.extent)
//        self.orgImageView.image = UIImage.init(cgImage: cgImage!)
        let option = Dictionary(dictionaryLiteral:(kCIContextUseSoftwareRenderer,true))
        let context = CIContext(options: option)
        
        let filter = CIFilter(name: "CIColorMonochrome")
        let ciImage = CIImage(image: self.orgImageView.image!)
        let color = CIColor(red: 0.8, green: 0.6, blue: 0.4)
        filter?.setValue(1.0, forKey: kCIInputIntensityKey)
        filter?.setValue(color, forKey: kCIInputColorKey)
        filter?.setValue(ciImage, forKey: kCIInputImageKey)
        
        let resultimage = filter?.outputImage
        let outImage = context.createCGImage((filter?.outputImage)!, from: (resultimage?.extent)!)
        self.orgImageView.image = UIImage.init(cgImage: outImage!)
    }
    
    
    func coreImageMosaic(){
        let ciImage = CIImage(image: self.orgImageView.image!)
        let filter = CIFilter(name: "CIPixellate")
        filter?.setDefaults()
        filter?.setValue(ciImage, forKey: kCIInputImageKey)
        let outImage = filter?.outputImage
        self.orgImageView.image = UIImage.init(ciImage: outImage!)
    }
    
    func coreImageVideo() {
        self.navigationController?.pushViewController(SwiftCoreImageVideoVC(), animated: true)
    }
    
    func coreImageAllFilter(){
//        let str = "CICategoryBuiltIn" //222
//       let str = "CICategoryDistortionEffect" //  18
//        let str = "CICategoryGeometryAdjustment" //13
//        let str = "kCICategorySharpen"
        let buildInFilter = CIFilter.filterNames(inCategory: kCICategoryBuiltIn)

        for item in buildInFilter{
            let filter = CIFilter(name: item as String)
            let att = filter?.attributes
            debugPrint("[\(String(describing: filter))]\n")
            debugPrint(att as Any)
            debugPrint("----------------------------")
        }
    }
    
    func CIDetectorAndCIFeature(){
        self.orgImageView.isHidden = true
        let imageView = UIImageView()
        self.view.addSubview(imageView)
        imageView.image = UIImage(named: "girls")
        imageView.snp.makeConstraints {
            $0.center.equalTo(self.view)
            $0.height.equalTo(630)
            $0.width.equalTo(320)
        }
        
        let ciImage = CIImage(image: imageView.image!)
        let ciContext : CIContext = {return CIContext(options: nil)}()
        let ciDetector = CIDetector(ofType: CIDetectorTypeFace, context: ciContext, options: [CIDetectorAccuracy:CIDetectorAccuracyHigh])//CIDetectorTypeFace 人脸识别
        
        //CoreImage 和 UIView的坐标系统转换操作
        let ciImageSize = ciImage!.extent.size
        var transform = CGAffineTransform.identity
        transform = transform.scaledBy(x: 1, y: -1)
        transform = transform.translatedBy(x: 0, y: -ciImageSize.height)//上下翻转平移操作
        
        
        let features : [CIFeature]! = ciDetector!.features(in: ciImage!)
        for feature in features{
            let frame = feature.bounds.applying(transform)
            let faceView = UIView(frame: frame)
            faceView.layer.borderWidth = 2
            faceView.layer.borderColor = UIColor.white.cgColor
            
            self.orgImageView.addSubview(faceView)
        }
    }
    
    func blurEffectMethod(){
        let blurlight = UIBlurEffect(style: .light)
        let blurlightView = UIVisualEffectView(effect: blurlight)
        self.orgImageView.addSubview(blurlightView)
        blurlightView.snp.makeConstraints {
            $0.left.bottom.equalTo(self.orgImageView)
            $0.right.equalTo(self.orgImageView.snp_centerX)
            $0.top.equalTo(self.orgImageView.snp_top).offset(100)
        }
//        blurView.layer.cornerRadius = 30
//        blurView.layer.masksToBounds = true
        
        let blurextraLight = UIBlurEffect(style: .dark)
        let blurextraLightView = UIVisualEffectView(effect: blurextraLight)
        self.orgImageView.addSubview(blurextraLightView)
        blurextraLightView.snp.makeConstraints {
            $0.left.equalTo(blurlightView.snp_right)
            $0.right.bottom.equalTo(self.orgImageView)
            $0.top.equalTo(self.orgImageView.snp_top).offset(100)
        }
    }
    
    func blendModelMethod(){
        let originalImage = UIImageView()
        originalImage.image = UIImage(named: "chrysanthemum tree")
        self.view.addSubview(originalImage)
        originalImage.snp.makeConstraints {
            $0.left.equalTo(self.view.snp_left).offset(20)
            $0.top.equalTo(self.changeImageBtn.snp_bottom).offset(30)
            $0.width.equalTo(70)
            $0.height.equalTo(100)
        }
        
        let redlImage = UIImageView()
        redlImage.image = UIImage(named: "chrysanthemum tree")?.blendColor(color: .red)
        self.view.addSubview(redlImage)
        redlImage.snp.makeConstraints {
            $0.left.equalTo(originalImage.snp_right).offset(20)
            $0.top.equalTo(self.changeImageBtn.snp_bottom).offset(30)
            $0.width.equalTo(70)
            $0.height.equalTo(100)
        }
        
        let orangeImage = UIImageView()
        orangeImage.image = UIImage(named: "chrysanthemum tree")?.blendColor(color: .orange)
        self.view.addSubview(orangeImage)
        orangeImage.snp.makeConstraints {
            $0.left.equalTo(redlImage.snp_right).offset(20)
            $0.top.equalTo(self.changeImageBtn.snp_bottom).offset(30)
            $0.width.equalTo(70)
            $0.height.equalTo(100)
        }
        
        
        let blueImage = UIImageView()
        blueImage.image = UIImage(named: "chrysanthemum tree")?.blendColor(color: .blue)
        self.view.addSubview(blueImage)
        blueImage.snp.makeConstraints {
            $0.left.equalTo(orangeImage.snp_right).offset(20)
            $0.top.equalTo(self.changeImageBtn.snp_bottom).offset(30)
            $0.width.equalTo(70)
            $0.height.equalTo(100)
        }
    }
    
    @objc func changeImage(){
        self.clickIndex += 1
        if self.clickIndex == 1{
            coreImageMethod()
            blendModelMethod()
        }else if self.clickIndex == 2{
            coreImageMosaic()
        }else if self.clickIndex == 3{
            blurEffectMethod()
        }else if self.clickIndex == 4{
            coreImageAllFilter()
        }else if self.clickIndex == 5{
            CIDetectorAndCIFeature()
        }
    }
    
    @objc func processVideo(){
        self.navigationController?.pushViewController(SwiftCoreImageVideoVC(), animated: true)
    }
    
    lazy var processVideoBtn : UIButton = {
       let processVideoBtn = UIButton()
        processVideoBtn.setTitle("处理视频-真机-相机", for: .normal)
        processVideoBtn.setTitleColor(.black, for: .normal)
        processVideoBtn.addTarget(self, action: #selector(processVideo), for: .touchUpInside)
        return processVideoBtn
    }()
    
    lazy var changeImageBtn : UIButton = {
       let changeImageBtn = UIButton()
        changeImageBtn.setTitle("处理图片", for: .normal)
        changeImageBtn.setTitleColor(.black, for: .normal)
        changeImageBtn.addTarget(self, action: #selector(changeImage), for: .touchUpInside)
        return changeImageBtn
    }()
    
    lazy var orgImageView : UIImageView = {
       let orgImageView = UIImageView()
        orgImageView.image = UIImage.init(named: "达芬奇-蒙娜丽莎")
        return orgImageView
    }()
}


extension UIImage{
    func blendColor(color : UIColor) -> UIImage{
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        color.setFill()
        UIRectFill(rect)
        let blendMode = CGBlendMode.destinationIn
        draw(in: rect, blendMode: blendMode, alpha: 1)
        
        let blendImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return blendImage!
    }
}
