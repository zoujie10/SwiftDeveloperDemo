//
//  SwiftAdvanceViewController.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2020/9/29.
//  Copyright © 2020 Zoujie. All rights reserved.
//

import UIKit

class SwiftAdvanceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        //函数定义和调用
		//1.传参
		
		//2.为参数设置默认值
    let str = sendFuncParams_default(str: "", numbers: 1,2,3)
        print("多参数 传参 === \(str)")
		//3.设置可变的函数参数数量
		//4.函数作为参数和返回类型
		//5.元组作为函数的返回类型，返回多个返回值
		//6.使用函数类型 （声明一个变量是函数）
		//7.函数的输入输出参数
		//8.函数的嵌套
        
		//9.函数的递归
        recursionByMehtod(param:"abcdefg")
		//10.常用内置函数 绝对值 最小值 最大值 filter map reduce
		//11.枚举语法 枚举值遍历 枚举原始值 给枚举添加方法
		//12.结构体定义 给结构体添加方法 结构体下标
		//13.类 类属性的set和get方法  willSet和didSet方法 类的静态方法 类的析构 类的继承 类的延迟加载（懒加载）  类的引用特征  类型检查 Any和AnyObject
        testClassMethod()
        
		//14.类和结构体 区别
		//15.扩展 扩展类型的属性 扩展类型的方法
		//16.协议 定义 继承 实现
		//17.其他 “？” “！”  Optional类型
    }
    
    //MARK:1.传参
    func sendNoParam(){
        
    }
    func sendFuncParams(param1 : String) -> String {
        let str = "参数"
        return str
    }
    func endFuncParams_Two(_ : Dictionary<String, Any>) {
        
    }
    //MARK:2.为参数设置默认值
    func sendFuncParams_default( str : String = "参数",numbers:NSNumber...) -> String {
        var mutstr = str
        for num in numbers {
            mutstr.append(num.stringValue)
        }
        return mutstr
    }
    
    //MARK:3.设置可变的函数参数数量
   
    //MARK:4.函数作为参数和返回类型  函数参数 method:(str:String,numbers:NSNumber) 返回函数  (String,NSNumber...) -> String 即为 sendFuncParams_default
    func sendParamByMethod(amount:String,method:(str:String,numbers:NSNumber)) -> (String,NSNumber...) -> String {
        return sendFuncParams_default
    }
    
    //MARK:5.元组作为函数的返回类型，返回多个返回值
   
    //MARK:6.使用函数类型 （声明一个变量是函数）
    let method_Noparm = sendNoParam
    let method_Param = sendFuncParams_default
    //MARK:7.函数的输入输出参数
   
    //MARK:8.函数的嵌套
    func nestInMehtod(){
        func nestInSubMetho(){
            print("嵌套函数")
        }
        
        nestInSubMetho()
    }
    //MARK:9.函数的递归
    func recursionByMehtod(param:String){
        let param1 = param
        if(param1.count > 0){
//            var nonempty = "non-empty"
            ///     if let i = nonempty.firstIndex(of: "-") {
            ///         nonempty.remove(at: i)
            ///     }
            ///     print(nonempty)
            ///     // Prints "nonempty"
            let str = param1.dropLast()
            print("递归函数-- 处理字符串 ---\(str) ----\(param1)")
            return recursionByMehtod(param: String(str))
        }else{
            return
        }
    }
    //MARK:10.常用内置函数 绝对值 最小值 最大值 filter map reduce
    func usuallyBuildInMethod(){
        
    }
    //MARK:11.枚举语法 枚举值遍历 枚举原始值 给枚举添加方法
    enum enumType {
        case typeOne
        case typeTwo
        case typeThree
        case typeFour
    }
    
    func enumMethod(){
//        let enumTpyeValue = enumType.typeOne
    }
    
    enum enumOriginalValue : String{
        case value1 = "value1"
        case value2 = "value2"
        case value3 = "value3"
        case value4 = "value4"
    }
    
    enum enumAddMethod : String {
        case enumOne
        case enumTwo
        case enumThree
        case enumNone
        func enumMethod() -> String {
            switch self {
                case .enumOne:
                    return "1"
                case .enumTwo:
                    return "2"
                case .enumThree:
                    return "3"
                default:
                    return "0"
            }
        }
    }
    let enumTypeV = enumAddMethod.enumTwo
    func enumPrintMethod(){
        print(enumTypeV.enumMethod())
    }
    
    //MARK:12.结构体定义 给结构体添加方法 结构体下标
    struct structDemo {
        var structStr : String
        var structDic : NSDictionary
        let paramInt : Int
        mutating func structMethod(){
            self.structStr = "结构体字符串"
            self.structDic = ["key":"value"]
        }
        //结构体下标
        subscript(index: Int) -> Int {
            return  paramInt / index
        }
    }
    func structDemoMethod(){
        let test = structDemo(structStr: "1", structDic: ["key":"value"], paramInt: 100)
        print("结构体脚标测试------\(test[9])")
    }
    
    //MARK:13.类 类属性的set和get方法  willSet和didSet方法 类的静态方法 类的析构 类的继承 类的延迟加载（懒加载）  类的引用特征  类型检查 Any和AnyObject
    class tempClass{
        var variName : String
        var setAndgetV : String {
            get
            {
                return "无" + variName
            }
            set(str)
            {
                variName =  str
            }
        }
        
        init() {
            variName = "v"
        }
    }
    
    var classTest = tempClass()
   
    func testClassMethod(){
        print(classTest.setAndgetV)
        classTest.setAndgetV = "5"
        print(classTest.variName)
    }
    
    
    //MARK:14.类和结构体 区别
    //MARK:15.扩展 扩展类型的属性 扩展类型的方法
    //MARK:16.协议 定义 继承 实现
    //MARK:17.其他 “？” “！”  Optional类型
    
}
