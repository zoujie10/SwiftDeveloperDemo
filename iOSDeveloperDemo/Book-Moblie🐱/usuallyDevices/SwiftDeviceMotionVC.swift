//
//  SwiftDeviceLocationVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/11/14.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit
import CoreLocation
import CoreMotion

class SwiftDeviceMotionVC: UIViewController {

    var motionManager : CMMotionManager!
    var label : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        geocoder()
        //3.陀螺仪和加速计设备的使用
        
        //3.1 陀螺仪的原理和应用
        /**
        一个旋转物体的旋转轴所指方向，在不受外力影响时是不会改变的。根据这个原理制造出来的陀螺仪，用它来保持方向。                手机导航，相机防抖，遥控输入，摇一摇
         */
        //3.2 加速计的原理和应用
        /**
            iPhone通过内置方向感应器来对动作做出反应。方向感应器实现靠的是内置的加速计。三轴加速计，分为X,Y,X
        */
        //3.3 检测设备晃动
          deviceMotion()
    }

    func geocoder(){
        let geocoder = CLGeocoder()
       
        let location = CLLocation(latitude: 39.9, longitude: 116.3)
        geocoder.reverseGeocodeLocation(location) { (placeMarks : [CLPlacemark]?, error :Error?) -> Void in
            if(placeMarks?.count)! > 0 {
                let placeMark = placeMarks?.first
                print(placeMark?.name as Any)
            }
        }
    }
    func deviceMotion(){
        label = UILabel()
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalTo(view)
        }
        label.text = "waiting!"
        label.backgroundColor = .orange
        label.numberOfLines = 3
        
        motionManager = CMMotionManager()
        motionManager.accelerometerUpdateInterval = 0.1 //每秒钟更新10次
        
        if motionManager.isAccelerometerAvailable {
            motionManager.startAccelerometerUpdates(to: OperationQueue.main) { (accelerometerData : CMAccelerometerData?,error : Error?)-> Void in
                
                if error != nil{
                    self.motionManager.stopAccelerometerUpdates()
                }else{
                    var message = ""
                    message += "X:\(String(describing: accelerometerData?.acceleration.x))\n"
                    message += "Y:\(String(describing: accelerometerData?.acceleration.y))\n"
                    message += "Z:\(String(describing: accelerometerData?.acceleration.z))\n"
                    
                    self.label.text = message
                }
            }
        }else{
            print("您的设备不支持加速计")
        }
    }
}
