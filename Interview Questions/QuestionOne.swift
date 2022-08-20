//
//  QuestionOne.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/8/19.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit
//被问到的一些面试问题
//1.conversion 与 自定义 init 的区别
//2.https与http  http需要三次握手吗
//3.unown关键词 和weak的区别
//4.iOS 系统推送
//5.基础数据类型是否可以指向 指针
class QuestionOne: NSObject {
//1 自定义初始化
	
	override init() {
		super.init()
	}
	
	init(data:[String]){

	}
	//便利初始化
	convenience init(index : Int , data : [String]){
		var string = ""
		if(data.count > 1){
			string = "1"
		}else{
			string = "0"
		}
		
		self.init(data: [string])
	}
	
}
extension QuestionOne{
	convenience init(index : Int , data : [String], dic : [String : String]){
		var string = ""
		if(data.count > 1){
			string = "1"
		}else{
			string = "0"
		}
		
		self.init(data: [string])
	}
	
}
