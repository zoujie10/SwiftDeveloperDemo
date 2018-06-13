//
//  DataPersistence.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2018/6/11.
//  Copyright © 2018年 Zoujie. All rights reserved.
//

import UIKit

class DataPersistence: NSObject {
	//1.Douments目录 存储大的文件或需要非常频繁更新的数据，能够进行iTunes或iCloud备份
	func documents(){
		let documentDirectory : NSArray = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
		//documentDirectory 数组只有一个元素
		let myDocPath = documentDirectory.lastObject as! NSString
		print(myDocPath)
	}
	//2.Library目录下的Preferences和Caches目录，Preferences用于存放应用程序的设置数据，Caches用来缓存文件
	//3.tmp 临时文件夹
	func tempDirectory() -> Void {
		let temp = NSTemporaryDirectory()
		print(temp)
	}
}
