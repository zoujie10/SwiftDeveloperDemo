//
//  AppStatusObserver.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2018/6/5.
//  Copyright © 2018年 Zoujie. All rights reserved.
//

import UIKit
//KVO监听类
@objcMembers class AppStatusObserver: NSObject {
	override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
		print((keyPath as NSString?) as Any,change![NSKeyValueChangeKey.newKey]! as! NSString)
	}
}
