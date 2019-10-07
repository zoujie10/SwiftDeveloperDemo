//
//  NoteDAO.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2019/10/5.
//  Copyright © 2019 Zoujie. All rights reserved.
//

import UIKit
protocol NoteDAODelegate {
	func findAllFinished(list:NSMutableArray)
	func findAllFailed(error:NSError)
	func findByFinished(model:Note)
	func findByFailed(error:NSError)
}
class NoteDAO: NSObject,NoteDAODelegate {
	func findAllFinished(list: NSMutableArray) {
		
	}
	
	func findAllFailed(error: NSError) {
		
	}
	
	func findByFinished(model: Note) {
		
	}
	
	func findByFailed(error: NSError) {
		
	}
	
	let HOST_PATH = "/service/mynotes/WebService.php"
	let HOST_NAME =  "baidu.com"
	let USER_ID = "89011810@qq.com"
	
	var delegate : NoteDAODelegate?
	var listData : NSMutableArray!
	
	class shareInstance {
		var date : DateFormatter = DateFormatter()
		var str1 : String = String()
		static let sharedInstance = shareInstance()
		private init() {} // 这就阻止其他对象使用这个类的默认的'()'初始化方法
	}
	
	override init() {
		super.init()
		self.delegate = nil
	}
	
	
}

