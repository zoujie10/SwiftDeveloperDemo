//
//  Singleton.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2018/6/4.
//  Copyright © 2018年 Zoujie. All rights reserved.
//
//*************************************************************************************************
//https://github.com/hehonghui/iOS-tech-frontier/blob/master/issue-14/单例在Swift中的正确实现方式.md  *
//*************************************************************************************************


//MARK:系统单例类
//		UIApplication.shared.open(<#T##url: URL##URL#>, options: <#T##[String : Any]#>, completionHandler: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
//		UserDefaults.standard.set(<#T##value: Any?##Any?#>, forKey: <#T##String#>)
//		FileManager.default
//		Bundle

import Foundation

//繁琐的单例
//class Singleton : NSObject{
//
//	open var shareString:String?
//
//	private static var _instance = Singleton()
//
//	class func getShareInstance() -> Singleton{
//		return _instance
//	}
//
//	private override init() {
//
//	}
//}

//优雅的单例
class Singleton {
	static let sharedInstance = Singleton()
	private init() {} // 这就阻止其他对象使用这个类的默认的'()'初始化方法
}
