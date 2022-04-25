//
//  SwiftCoreImageVideoVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/11/6.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit
import CoreImage
import AVFoundation

class SwiftCoreImageVideoVC: UIViewController,AVCaptureVideoDataOutputSampleBufferDelegate {
   
    var filter : CIFilter!
    var ciImage : CIImage!
    var cgImage : CGImage!
    var videolayer : CALayer!//用来展示应用滤镜后的视频流截图
    var imageView : UIImageView!
    var avCaptureSession : AVCaptureSession!//获得相机设备的数据流
    var context:CIContext = {//应用滤镜后的CIImage转换为CGImage格式的图像，提交给videoLayer用
        return CIContext(eaglContext: EAGLContext(api: EAGLRenderingAPI.openGLES2)!,options: nil)//Project--Build Settings 里找到 Preprocessor Macros ，然后配置 CI_SILENCE_GL_DEPRECATION 把EAGLContext相关的警告去掉
    }()
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        filter = CIFilter(name: "CIPhotoEffectTransfer")
        buildUI()
        buildSession()
    }
    func buildUI(){
        videolayer = CALayer()
        videolayer.anchorPoint = CGPoint.zero
        videolayer.bounds = view.bounds
        self.view.layer.insertSublayer(videolayer, at: 0)
        
        imageView = UIImageView(frame: view.bounds)
        self.view.addSubview(imageView)
        
        let button = UIButton(frame: CGRect(x: 0, y: 420, width: 320, height: 60))
        button.setTitle("截取图片", for: .normal)
        button.addTarget(self, action: #selector(captureScreen), for: .touchUpInside)
        self.view.addSubview(button)
    }
    func buildSession(){
        avCaptureSession = AVCaptureSession()
        avCaptureSession.beginConfiguration()
        avCaptureSession.sessionPreset = AVCaptureSession.Preset.high//质量较高的视频流和音频流  AVCaptureSessionPreseHigh
        
        let captureDevice = AVCaptureDevice.default(for: .video)!
        let deviceInput = try! AVCaptureDeviceInput(device: captureDevice)
        if avCaptureSession.canAddInput(deviceInput){
            avCaptureSession.addInput(deviceInput)
        }
        
        let dataOutPut = AVCaptureVideoDataOutput()
        dataOutPut.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String: Int(kCVPixelFormatType_32BGRA)]
        dataOutPut.alwaysDiscardsLateVideoFrames = true
        if avCaptureSession.canAddOutput(dataOutPut){
            avCaptureSession.addOutput(dataOutPut)
        }
        
        let queue = DispatchQueue(label: "VideoQueue",attributes: .concurrent)
        dataOutPut.setSampleBufferDelegate(self, queue: queue)
        
        avCaptureSession.commitConfiguration()
        avCaptureSession.startRunning()
        
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        autoreleasepool {
            let imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer)!
            var ciImage = CIImage(cvPixelBuffer: imageBuffer)
            
            self.filter.setValue(ciImage, forKey: kCIInputImageKey)
            ciImage = self.filter.outputImage!
            
            let orientation = UIDevice.current.orientation
            if orientation == UIDeviceOrientation.portraitUpsideDown{
                ciImage = ciImage.transformed(by: CGAffineTransform(rotationAngle: CGFloat(Double.pi/2.0)))
                
            }else if orientation == UIDeviceOrientation.portrait{
                ciImage = ciImage.transformed(by: CGAffineTransform(rotationAngle: CGFloat(Double.pi/(-2.0))))
            }else if orientation == UIDeviceOrientation.landscapeRight{
                ciImage = ciImage.transformed(by: CGAffineTransform(rotationAngle: CGFloat(Double.pi)))
            }
            
            self.ciImage = ciImage
            
            self.cgImage = self.context.createCGImage(ciImage, from: ciImage.extent)

            DispatchQueue.main.sync {
                self.videolayer.contents = cgImage

            }
        }
    }
    
    @objc func captureScreen(_ sender : UIButton){
        avCaptureSession.stopRunning()
        videolayer.removeFromSuperlayer()
        sender.isHidden = true
        self.imageView.backgroundColor = UIColor.red
//        self.imageView.image = UIImage(ciImage: self.ciImage)//显示不了ciimage
        self.imageView.image = UIImage(cgImage: self.cgImage)
    }
}
