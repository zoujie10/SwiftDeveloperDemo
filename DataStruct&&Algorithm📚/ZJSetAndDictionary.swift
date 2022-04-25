//
//  ZJSetAndDictionary.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2018/8/31.
//  Copyright © 2018年 Zoujie. All rights reserved.
//

import UIKit

class ZJSetAndDictionary: NSObject {
	var primeNums : Set = [3,5,7,9,13,15]
	var oddNums : Set = [3,7,9,13]
	
	public func intersectionBySet(setOne : Set<Int>, setTwo : Set<Int>) -> Set<Int>{
		let primeAndOddNums = setOne.intersection(setTwo)
		return primeAndOddNums
	}
	
	public func formUnionBySet(setOne : Set<Int>, setTwo : Set<Int>) -> Set<Int>{
		var attendees: Set = setOne
		let visitors:Set = setTwo
		attendees.formUnion(visitors)
		return attendees
	}
	
	public func subtractingBySet(setOne : Set<Int>, setTwo : Set<Int>) -> Set<Int>{
		let oddNotPrimeNums = setOne.subtracting(setTwo)
		return oddNotPrimeNums
	}
	
	public func twoSum(nums : [Int], target : Int) -> Bool{
		var set = Set<Int>()
		
		for num in nums{
			if  set.contains(target - num){
				return true
			}
			set.insert(num)
		}
		return false
	}
	
	public func TwoSumDic(nums : [Int], _ target : Int) -> [Int]{
		var dic = [Int : Int]()
		
		for (i , num) in nums.enumerated(){
			if let lastIndex = dic[target - num]{
				return [lastIndex , i]
				
			}else{
				dic[num] = i
			}
		}
		fatalError("No vaild output")
	}
}
