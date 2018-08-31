//
//  ZJString.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2018/8/31.
//  Copyright © 2018年 Zoujie. All rights reserved.
//

import UIKit

class ZJString: NSObject {
	var stringOne : String
	
	override init() {
		self.stringOne = "103456789"
	}
	
	func method(){
		
		//访问字符串中的单个字符
		let char = self.stringOne[self.stringOne.index(self.stringOne.startIndex, offsetBy: 2)]
		//字符串长度
		print(self.stringOne.count,char)
	}
	
	//检测字符串是否由数字组成
	func isNumstr(str:String)->Bool{
		return Int(str) != nil
	}
	func isPurnInt(string: String) -> Bool {
		
		let scan: Scanner = Scanner(string: string)
		
		var val:Int = 0
		
		return scan.scanInt(&val) && scan.isAtEnd
	}
	
	//将字符串按字母排序（先大写后小写）
	func sortStr(str:String)->String{
		return String(str.sorted())
	}
	
	//Google Q：给出一个字符串，要求将其按照单词顺序进行反转  -- the sky is blue --> blue is sky the
	fileprivate func _reverse<T>(_ chars:inout [T], _ start:Int, _ end :Int){
		var start = start ,end = end
		
		while start < end {
			swap(&chars,start,end)
			start += 1
			end -= 1
		}
	}
	
	fileprivate func swap<T>(_ chars:inout [T],_ p : Int, _ q : Int){
		(chars[p],chars[q]) = (chars[q],chars[p])
	}
	
	
	func reveseWords(s:String?)->String?{
		guard let s = s else{
			return nil
		}
		//Substring directly
		var chars = Array(s.characters), start = 0
		_reverse(&chars, 0, chars.count - 1)//反转整个句子
		
		for i in 0 ..< chars.count{
			if i == chars.count - 1 || chars[i + 1] == " "{
				_reverse(&chars, start, i)//反转单词
				start = i + 2
			}
		}
		
		return String(chars)
	}
}
