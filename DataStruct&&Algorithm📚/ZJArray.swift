//
//  ZJArray.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2018/8/31.
//  Copyright © 2018年 Zoujie. All rights reserved.
//

import UIKit

class ZJArray: NSObject {
	var arrayStruct1 = Array<Int>()
	var nums : ContiguousArray = [11,2,3,5,7,8]
	var ArraySlice : ArraySlice<Any> = ["StringOne",1]
	
	override init() {
		self.arrayStruct1.reserveCapacity(1)
		
	}
	let numsArray = [Array](repeating:[11,2,3,5,7,8], count: 3)
	let numsInt = [Int](repeating: 0, count: 3)
	
	func TakeArray(){
		let numsArray = [ContiguousArray](repeating:self.nums, count: 3)
		let numsInt = [Int](repeating: 0, count: 3)
		print(numsArray,numsInt)
	}
	
	func sortedArray() -> ContiguousArray<Int>{
		self.nums.sort()
		self.nums.sort(by : > )
		return self.nums
	}
	
	func deleteLastOne() -> Array<Int>{
		let ArrayDeleteLast = Array(self.nums[0 ..< self.nums.count - 1])
		return ArrayDeleteLast
	}
	
}

class Stack {
	var stack : [AnyObject]
	var isEmpty : Bool{return stack.isEmpty}
	var peek : AnyObject?{return stack.last}
	
	
	init() {
		stack = [AnyObject]()
	}
	
	public func push(object : AnyObject){
		stack.append(object)
	}
	
	public func pop() -> AnyObject?{
		if (!isEmpty){
			return stack.removeLast()
		}else{
			return nil
		}
		
	}
}
