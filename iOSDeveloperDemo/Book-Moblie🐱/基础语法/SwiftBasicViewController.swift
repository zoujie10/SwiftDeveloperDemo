//
//  SwiftBasicViewController.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2020/9/15.
//  Copyright © 2020 Zoujie. All rights reserved.
//

import UIKit

class SwiftBasicViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		self.view.backgroundColor = UIColor.red
		//basic
		basicSwift()
		//string
		dataString()
		//元组
		dataTuple()
		//dataOperator 运算符
		dataOperator()
		//循环语句
		cycleMethod()
		//数组和字典 为了安全性 都通过显示类型标注或类型推断 创建
		//array
		arrayMethod()
		//dictionary
		dictionaryMethod()
    }
    
	func basicSwift(){
		let pi = 3.141592
		var enemyKilled = 100
		var wide = 100*pi,length = 200*pi,height = 10*pi
		
		var age : Int = 10*enemyKilled
		age+=1
		enemyKilled += 1
		let 猫 = "cat"
		let 👿 = "evel"
		
		let name = "邹杰"
		
		print(猫)
		debugPrint(👿)
		dump(age)
		
		print("我的名字叫\(name),年龄\(age).")
		print("杀敌人数"+String(enemyKilled)+".")
		
	}
 
	func commentMethod() {
		//
		/*
			/*
			*/
		*/
	}

	func dataString() -> Void {
		let isFriend = true
		if(isFriend){
			print("是好朋友")
		}
//		Int 自动兼容32（Int32），64位平台(Int64)
		let minValueOfUInt8 = UInt8.min
		let maxValueOfUInt8 = UInt8.max
//		UInt16.min
//		UInt.max
		
//		Float 小数精度6位
//		Double 小数精度15位
		
		var number = -10.10
		number.advanced(by: 10) //+10
		number.distance(to: 23.3) //-
		number.isFinite //是否有限
		number.isInfinite //是否无限
		number.isZero //是否是零
		number.isLess(than: 1) //是否小于
		
//		Character
		let characterA : Character = "A"
		let sun = "\u{2600}"
		
//		String
		let str = "\(characterA)+\(sun)"
		let str1 = ""
		let str2 = String()
		str.isEmpty
//		转义符
		/*
		/0 空字符
		/r 回车符
		\\ 反斜杠
		\n 换行符
		\" 双引号
		*/
		var  message = "Hi Jerry.\n\"Good Morning\""
		//判断字符串的前后部分
        print(message.hasPrefix("Jerry"))
        print(message.hasSuffix("Morining"))
		//大小写转换
		message.uppercased()
		message.lowercased()
		//截取和替换  NSString
//		message.substring(to: <#T##String.Index#>)
//		message.substring(from: )
		message.replacingOccurrences(of:"Hi", with:"Hello")
		message.remove(at: message.index(message.startIndex, offsetBy: 5))
		//字符串遍历
		var num = 0
		let hello = "18971118756"
		for temp in hello {
			if temp == "1"{
				num+=1
			}
		}
	}
	
	
	func dataTuple(){
		//用作临时复合值，用作函数的返回值
		let people = ("man",17)//(String,Int)类型的常量
		
		print(people.0)
		
		let person = (name:"Zoujie",age:20)
		print(person.name,person.age)
		
		
		let result =	(2,3)>(1,3)//true
		let result1 = ("class1",98)>("class2",54)//false
		let result2 = (7,"Sunday")==(7,"Sunday")
	}
	
	func dataOperator(){
		let one = 1
		
		let minOne = -one
		let plusOne = +one
		print(minOne,plusOne)
        
		let isMan = true
		let isMen = !true
		print(isMan,isMen)
        
		let two1 = 3+2
		let two2 = 3-2
		let two3 = 3*2
		let two4 = 3/2
		let two5 = 3%2
		print(two1,two2,two3,two4,two5)
        
		let three = 33
		let result = (three >= 20) ? true : false
	}
	
	func cycleMethod() {
		//for
		for index in 0..<3{
			
		}
		for index in 0...3{
			
		}
		
		let array = ["1","2","3"]
		for index in array{
			
		}
		
		let  dic = ["1":1,"2":2,"3":3]
		for (num , age) in dic{
			print(num + "\(age)")
		}
		
		//while
		var index = 0
		while index < 3 {
			if(index == 2){
//				continue//停止本次循环，进入下次循环
			}
			index+=1
		}
		
		repeat{//至少会被执行一次
			index+=1
		}
		while index < 3
		
		
		let time = 12
		switch time {
			case 7:
				print("7")
				fallthrough//执行完一个case分支，跳入下个分支
			case 8,9,10:
				print("8")
			case let x where x>10 && x<12://使用x绑定常量。从而判断10~12的值
				print("Happy Time")
			case 1...3:
				print("low time")
				
			default:
				print("keep busy")
		}
	}
	
	func arrayMethod() {
		let strArray = Array<String>()
		let intArray = [Int]()
		var array = [1,2,3,4,5]
		
		print(array[0])
        print(intArray.isEmpty)
        print(intArray.count)
        print(intArray.contains(3))
		
		array += [6]
		array.append(7)
		array.insert(8, at: 3)
		
		array[3...5] = [8,9,10]
        //MARK:删除操作
		array.removeFirst()
		array.removeAll()
        if(array.count > 3){
            array.remove(at: 2)
        }else if(array.count > 4){
            array.removeSubrange(Range(1..<3))//remove index 1-2
        }
		array.sort()//升序
		array.sort(by:>)//降序
		
		//MARK:复杂类型排序
		var userList = [(name:"TT",age:20),(name:"BB",age:21),(name:"CC",age:22),(name:"AA",age:24)]
		userList.sort(by: {$0.name > $1.name})//$0,$1 占位变量
		
		//MARK:多维数组
		let int_Array = [[Int]]()
		var numbers = [["1","2","3"],["1","2","3"]]
		numbers.append(["4"])
		let number = numbers[1][2]
		print(number)
        
		//MARK:数组遍历
		for index in int_Array {
			print(index)
		}
		for index in 0 ..< int_Array.count{
			print(index)
		}
		
		let range = 2 ..< numbers.count
		for (index,value) in zip(range, numbers[range]) {
			print(index,value)
		}
		
		//MARK:复杂元素数组遍历
		for (student,age) in userList {
			print(student,age)
		}
		
		//MARK:多维数组遍历
		for subNumbers in numbers{
			for sub_Number in subNumbers{
				print(sub_Number)
			}
		}
	}
	
	
	func dictionaryMethod(){
		var dic = ["key":"value","key2":"value2","key3":"value3"]
		var dic1 = Dictionary<String,String>()
		
		let string = dic["key"]
		dic.updateValue("value_1", forKey: "key")
		dic.removeValue(forKey: "key")
		dic["key2"] = nil
		for key in dic.keys {
			
		}
		
		for value in dic.values{
			
		}
		
		for (key,value) in dic{
			
		}
	}
}
