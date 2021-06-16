//
//  IteratorTools.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/6/16.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit
protocol IteratorTools {//数组
	func IteratorMethod(object : IteratorToolsClass) -> Array<IteratorToolsClass> //添加对象
	//索引删除
	func IteratorDeleteByIndexMethod(index : Int) -> Array<IteratorToolsClass>
	//对象删除
	//循环遍历
	func IteratorMethodAll() -> IteratorToolsClass
	//所以插入
	
}

class IteratorToolsClass{
	var age : NSInteger = 0
	let name : String = ""
}
//迭代器 模式 功能
/**

*/
class IteratorConcrete: IteratorTools {
	var data = Array<IteratorToolsClass>()
	var indexMax = 0
	func IteratorMethod(object: IteratorToolsClass) -> Array<IteratorToolsClass> {
		self.data.append(object)
		return self.data
	}
	func IteratorDeleteByIndexMethod(index: Int) -> Array<IteratorToolsClass> {
		self.data.remove(at: index)
		return self.data;
	}

	func IteratorMethodAll() -> IteratorToolsClass {
		self.indexMax = self.data.count
//		for item in self.data{
//
//		}
		return IteratorToolsClass()
	}
	
	func NSEnumeratorMethod() {
		let enumItem  = self.data.enumerated()
		for item in enumItem{
			print(item)
		}
	}
}
