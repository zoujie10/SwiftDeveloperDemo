//
//  DeviceInfo.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2018/5/10.
//  Copyright © 2018年 Zoujie. All rights reserved.
//

import Foundation
import UIKit

//MARK 设备信息
func deviceInfo(){
	let deviceInfoSize : CGSize = UIScreen.main.bounds.size
	print("Device Size",deviceInfoSize,UIDevice.current.name,UIDevice.current.model,UIDevice.current.systemName,UIDevice.current.systemVersion)
	
	switch UIDevice.current.userInterfaceIdiom {
	case UIUserInterfaceIdiom.phone:
		print("iphone")
		break
	case UIUserInterfaceIdiom.pad:
		print("pad")
		break
	case UIUserInterfaceIdiom.carPlay:
		print("carplay")
		break
	default:
		print("unknow")
		break
	}
	if deviceInfoSize.height > deviceInfoSize.width{
		print("portrait")
	}else {
		print("landscape")
	}
}
