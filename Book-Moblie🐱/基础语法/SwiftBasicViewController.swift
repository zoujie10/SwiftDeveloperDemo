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
        title = "Swift基础语法"
		self.view.backgroundColor = UIColor.white
		//basic 声明常量 变量 let var ，打印 print dump
 		basicSwift()
		//string
		dataString()
		//元组
		dataTuple()
		//dataOperator 运算符
		dataOperator(num: 30)
		//循环语句
		cycleMethod(num: 12)
		//数组和字典 为了安全性 都通过显示类型标注或类型推断 创建
		//array
		arrayMethod()
		//dictionary
		dictionaryMethod()
    }
    
	func basicSwift(){
        print("Swift基础之声明常量 变量 let var ，打印 print dump")
		let pi = 3.141592
		var enemyKilled = 100
		let wide = 100*pi,length = 200*pi,height = 10*pi
		var age : Int = 10*enemyKilled
		age+=1
		enemyKilled += 1
		let 猫 = "cat"
		let 👿 = "evel"
		let name = "邹杰"
        print("直接打印变量：",猫)
		debugPrint("debugPrint打印log:",👿,wide,length,height)
        /* dump 能直接打印出对象的信息
        * - T：是要打印的参数，是一个范型，也就是支持输出各种类型
        * - name： 默认是空白，如果加上则会在打印内容前加入这个name
        * - indent：缩进，默认是0，如果设置则会向前缩进相应的空白
        * - maxDepth：最大深度，默认全部打印，可以根据层级需要设置这个参数
        * - maxItems：最大条数，默认是全部打印，如果需要限制内容，可以设置这个参数
        */
        dump(age,name:"dump打印log")
		
		print("变量放入字符串中：","我的名字叫\(name),年龄\(age).")
		print("字符串类型/数字类型/换行符/放入字符串中：","杀敌人数"+String(enemyKilled)+"."+"\n")
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
			print("打印Bool值:\(isFriend)")
		}
//		Int 自动兼容32（Int32），64位平台(Int64)
		let minValueOfUInt8 = UInt8.min
		let maxValueOfUInt8 = UInt8.max
        debugPrint(minValueOfUInt8,maxValueOfUInt8)
//		UInt16.min
//		UInt.max
		
//		Float 小数精度6位
//		Double 小数精度15位
		let number = -10.10
		let num1 = number.advanced(by: 10) //+10
		let num2 = number.distance(to: 23.3) //-
		let num3 = number.isFinite //是否有限
		let num4 = number.isInfinite //是否无限
		let num5 = number.isZero //是否是零
		let num6 = number.isLess(than: 1) //是否小于
        debugPrint(number,num1,num2,num3,num4,num5,num6)
//		Character
		let characterA : Character = "A"
		let sun = "\u{2600}"
		
//		String
		let str = "\(characterA)+\(sun)"
		let str1 = ""
		let str2 = String()
		let str3 = str.isEmpty
        debugPrint(str,str1,str2,str3)
//		转义符
		/*
		/0 空字符
		/r 回车符
		\\ 反斜杠
		\n 换行符
		\" 双引号
		*/
		var  message = "Hi Jerry.\n\"Good Morning\""
        print("原字符串message:",message)
		//判断字符串的前后部分
        print("判断message字符串的前缀部分:",message.hasPrefix("Jerry"))
        print("判断message字符串的后缀部分:",message.hasSuffix("Morning\""))
		//大小写转换
		let msg1 = message.uppercased()
		let msg2 = message.lowercased()
        print("大小写转换:",msg1,msg2)
		//截取和替换  NSString
//		message.substring(to: <#T##String.Index#>)
        print("截取字符串扩展从 （i） -- end",message.substring(from:1 ))
		let msg3 = message.replacingOccurrences(of:"Hi", with:"Hello")
		let msg4 = message.remove(at: message.index(message.startIndex, offsetBy: 5))
        print("截取和替换:",msg3,msg4)
		//字符串遍历
		var num = 0
		let hello = "18971118756"
		for temp in hello {
			if temp == "1"{
				num+=1
			}
		}
        print("字符串遍历18971118756包含几个1:",num)
        debugPrint("\n")
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
        print(result,result1,result2,"\n")
	}
	
    func dataOperator(num : Int){
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
		print("3+2=",two1,"3-2=",two2,"3*2",two3,"3/2",two4,"3%2",two5)
        
		let result = (num >= 20) ? true : false
        debugPrint("表带式:(num >= 20) ? true : false  =",result,"\n")
	}
	
    func cycleMethod(num : Int) {
		//for
        
		for _ in 0..<3{
            print("for in  0..<3")
		}
      
		for _ in 0...3{
            print("for in  0...3")
		}
       
		let array = ["1","2","3"]
		for item in array{
			print("for in array = \(item)")
		}
		
		let  dic = ["1":1,"2":2,"3":3]
		for (num , age) in dic{
			print("for (num , age) in dic  = ",num + "\(age)")
		}
		
		//while
		var index = 0
		while index < 3 {
			if(index == 2){
//				continue//停止本次循环，进入下次循环
			}
			index+=1
            print("while index < 3",index)
		}
		
		repeat{//至少会被执行一次
			index+=1
		}
		while index < 3
		
		
		let time = num
		switch time {
			case 7:
				print("7","switch ----- fallthrough---执行完一个case分支，跳入下个分支")
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
        print("\n")
	}
	
	func arrayMethod() {
		let strArray = Array<String>()
		let intArray = [Int]()
		var array = [1,2,3,4,5]
		
		print("数组声明：Array<String>()，[Int]()，[1,2,3,4,5]",strArray,array[0])
        print(intArray.isEmpty)
        print(intArray.count)
        print(intArray.contains(3))
		
		array += [6]
        print("array += [6]",array += [6])
		array.append(7)
        print("array.append(7)",array.append(7))
		array.insert(8, at: 3)
        print("array.insert(8, at: 3)",array.insert(8, at: 3))
		array[3...5] = [8,9,10]
        print("array[3...5] = [8,9,10]",array[3...5] = [8,9,10])
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
        print("\n")
	}
	
	
	func dictionaryMethod(){
		var dic = ["key":"value","key2":"value2","key3":"value3"]
		let dic1 = Dictionary<String,String>()
		
		let string = dic["key"]
		dic.updateValue("value_1", forKey: "key")
		dic.removeValue(forKey: "key")
		dic["key2"] = nil
        debugPrint("打印dic1, string ",dic1,string as Any)
		for key in dic.keys {
			print(key)
		}
		
		for value in dic.values{
			print(value)
		}
		
		for (key,value) in dic{
			print(key,value)
		}
	}
}
