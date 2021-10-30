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
        endFuncParams_Two(["str":1])
		
        //2.为参数设置默认值  3.设置可变的函数参数数量
        let str = sendFuncParams_default(str: "", numbers: 1,2,3)
        print("多参数 传参 === \(str)")
        
		//4.函数作为参数和返回类型
        let result =  sendParamByMethod(amount: "1", method:paramMethod)
        debugPrint(result)
		
        //5.元组作为函数的返回类型，返回多个返回值
        loginMethod()
		//6.使用函数类型 （声明一个变量是函数）
        useMethodType()
		//7.函数的输入输出参数
		//8.函数的嵌套
        
		//9.函数的递归
        recursionByMehtod(param:"abcdefg")
		
        //10.常用内置函数 绝对值 最小值 最大值 filter map reduce
        usuallyBuildInMethod()
		
        //11.枚举语法 枚举值遍历 枚举原始值 给枚举添加方法
        enumPrintMethod()
		
        //12.结构体定义 给结构体添加方法 结构体下标
		//13.类 类属性的set和get方法  willSet和didSet方法 类的静态方法 类的析构 类的继承 类的延迟加载（懒加载）  类的引用特征  类型检查 Any和AnyObject
        testClassMethod()
        anyAndAnyObjectMethod()
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
    //3.设置可变的函数参数数量 不确定参数数量，可通过在变量类型后面加（...），定义可变参数
    func sendFuncParams_default( str : String = "参数",numbers:NSNumber...) -> String {
        var mutstr = str
        for num in numbers {
            mutstr.append(num.stringValue)
        }
        return mutstr
    }
    //MARK:4.函数作为参数和返回类型
    //函数参数 method:(String,NSNumber) -> Int 即为 paramMethod
    //返回函数  (String,NSNumber...) -> String 即为 sendFuncParams_default
    func paramMethod(str:String,numbers:NSNumber) -> Int{
        return 1
    }
   
    func sendParamByMethod(amount:String,method:(String,NSNumber) -> Int) -> (String,NSNumber...) -> String {
        return sendFuncParams_default
    }
    
    //MARK:5.元组作为函数的返回类型，返回多个返回值
    func getUserInfo(userId : String) ->(userName: String,useInfo:String,usePhoto:String){
        return ("name","info","pathUrl=https://xxx.xxx.xxx")
    }
    
    
    func loginMethod(){
        let loginBtn = getUserInfo(userId: "10000")
        let name =  loginBtn.userName
        let useInfo =  loginBtn.useInfo
        let url = loginBtn.usePhoto
        debugPrint(name,useInfo,url)
    }
    //MARK:6.使用函数类型 （声明一个变量是函数）
    func useMethodType(){
        let newMethod : (String)->String = sendFuncParams
        let newMehtodResult = newMethod("str")
        debugPrint(newMehtodResult)
    }
    
    let method_Noparm = sendNoParam
    let method_Param = sendFuncParams_default
    
    //MARK:7.函数的输入输出参数  "inout"关键字 想要一个函数可以修改参数的值，并且这些修改在函数结束调用后仍然存在（反应在调用处），传入的参数只能是变量不能是常量，传入的参数作为输入输出参数时，需要在参数面前加上“&”符号，表示这个参数值是可以被修改的
    func swapMethod(param1 : inout String,param2 : inout String){
        let tempNumber = param1
        param1 = param2
        param2 = tempNumber
    }
    
    func inoutMethod(){
        var param1 = "one"
        var param2 = "two"
        swapMethod(param1: &param1, param2: &param2)
        debugPrint(param1,param2)
    }
    
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
        //abs绝对值函数 转换为正数
        print(abs(-100))
        //min最小值函数 返回不定数量参数间的最小值
        print(min(1,2,3))
        //max最大值函数
        print(max(1,2,3,4))
        //filter 函数 查找数组元素满足条件的元素
        for i in (1...10).filter({ $0%3 == 0}){
            print(i)
        }
        //map函数 通常用于将数组中的每个元素，通过指定方法进行转换
        for i in (1...4).map({ $0 * 3}){
            print(i)
        }
        //reduce函数 可以把数组元素组合计算为一个值 + - * /
        let resultOne = (1...4).reduce(0,{$0+$1})
        print("reduce函数resultOne----\(resultOne)")
        let resultTwo = (1...4).reduce(0,+)
        print("reduce函数resultTwo----\(resultTwo)")
        let resultThree = (1...4).reduce(1,*)
        print("reduce函数resultThree----\(resultThree)")
    }
   
    //MARK:11.枚举语法  枚举值遍历 枚举原始值 给枚举添加方法
    enum EnumType : Int{//枚举原始值
        case typeOne = 1
        case typeTwo
        case typeThree
        case typeFour
    }
    
    enum ChineseEnumType {
        case 老板,经理,正式员工,外派员工
    }
    
    func enumMethod(){
//        let enumTpyeValue = enumType.typeOne
        let chinese = ChineseEnumType.老板
        
        switch chinese {
            case .老板:
                debugPrint(chinese)
            case .经理:
                debugPrint(chinese)
            case .外派员工:
                debugPrint(chinese)
          
            default:
                debugPrint(chinese)
        }
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
                return "old --" + variName
            }
            set(str)
            {
                variName =  str
            }
        }
        
        init() {
            variName = "value"
        }
    }
    
    //willSet和didSet方法
    class Hero{
        var powerValue : Int = 100
        var damage : Int = 10
        var name : String
        var level : Int = 1
        {
            willSet{
                print("即将给level,设置新值\(newValue)")
            }
            didSet{
                if level > oldValue{
                    print("Level UP!!!!")
                }else{
                    print("Sorry!!!!")
                }
            }
        }
        func money(){
            print("Hero")
        }
        init(name:String) {
            self.name = name
        }
    }
    //类的静态方法 //类的析构
    class MathTool {
        class func sum(num1:Int,num2:Int)->Int{
            return num1 + num2
        }
        class func reduce(num1:Int,num2:Int)->Int {
            return num1 - num2
        }
        deinit {//类的析构
            print("释放")
        }
    }

    //类的继承 //类的延迟加载（懒加载）
    class womenHero : Hero{
        
        override func money() {
            print("womenHero")
        }
        lazy var showMoney = MathTool()
    }
 
    class manHero : Hero{
        
    }
    //引用特征
    func strongValueMethod(){
        let hero = Hero.init(name: "Lion")
        let otherHero = hero
        
        otherHero.name = "Tony"
        print(hero.name,otherHero.name)//Tony,Tony
    }
    //类型检查 is  类型转换 as
    func isAndAsMethod() {
        let hero : [Hero] = [
            manHero.init(name: "BatMan"),
            womenHero.init(name: "CatMan"),
            manHero.init(name: "IronMan"),
            womenHero.init(name: "black widow"),
            manHero.init(name: "SpiderMan")
        ]
        var manCount = 0
        var womenCount = 0
        for item in hero{
            if item is manHero{
                manCount = manCount+1
            }else{
                womenCount = womenCount+1
            }
        }
        print(manCount,womenCount)
        
        for item in hero{
            if let man = item as? manHero{
                manCount = manCount+1
                print(man.name)
            }else{
                womenCount = womenCount+1
            }
        }
    }
    //Any和AnyObject
    func anyAndAnyObjectMethod(){
        var anyThing = [Any]()
        anyThing.append("1")
        anyThing.append(100)
        anyThing.append(["1","2"])
        anyThing.append(["key":"value"])
        anyThing.append(3.1415)
        
        for item in anyThing{
            switch item {
                case let someInt as Int:
                    print(someInt)
                case let someStr as String:
                    print(someStr)
                case let someDic as Dictionary<String, String>:
                    print(someDic)
                case let someF as Double:
                    print(someF)
                case let someArray as Array<String>:
                    print(someArray)
                default:
                    print("unKnow value")
            }
        }
    }
    
    var classTest = tempClass()
   
    func testClassMethod(){
        print(classTest.setAndgetV)
        classTest.setAndgetV = "5"
        print(classTest.variName,classTest.setAndgetV)
        var hero : Hero? = Hero.init(name: "1")
        hero!.level = 8
        hero!.level = 7
        print(hero!.level)
        print(MathTool.sum(num1: 1, num2: 2))
        let wonmenHero = womenHero.init(name: "2")
        print(hero?.money() ?? "无",wonmenHero.money())
        hero = nil
        strongValueMethod()
        isAndAsMethod()
    }
    
    
    //MARK:14.类和结构体 区别
    /*
    | 属性特征 | 类 | 结构体 |
    | --- | --- | --- |
    | 定义属性用于存储值 | √ | √ |
    | 定义方法用于提供功能 | √ | √ |
    | 定义下标脚本用于允许使用下标语法访问值 | √ | √ |
    | 定义初始化器用于初始化状态 | √ | √ |
    | 可以被扩展来实现默认所没有的功能 | √ | √ |
    | 遵循协议来针对特定类型提供标准功能 | √ | √ |
    | 继承允许一个类集成另一个类的特征 | √ |   |
    | 类型转换允许你在运行时检查和解释一个类实例的类型 | √ |  |
    | 反初始化器允许一个类实例释放任何被其分配的资源 | √ |  |
    | 引用计数允许不止一个对类实例的引用 | √ |  |
 */
    //MARK:15.扩展 扩展类型的属性 扩展类型的方法
    func extensionMethod(){
        print(9.kb,10.mb,100.gb)
        print("s".prependString(value: "20"))
        let start = XYPoint.init(x: 0, y: 0)
        let end = XYPoint.init(x: 100, y: 100)
        print(start.distance(point: end))
    }
    //MARK:16.协议   定义 继承 实现
    func protocolMethod(){
        let structClass = Rectangle.init(width: 100, height: 80)
        print(structClass.computeArea(),structClass.computePerimeter())
    }
    
    //MARK:17.其他 “？” “！”  Optional类型
    func OptionalMethod(){
//        Optional.none Optional.some
        let password : String?
        password = "1"
        //“？” 表示password属于Optional类型，他的值可能是String，也可能是nil
        let passwordOne : String!
        passwordOne = "one"
        //“!” 表示passwordOne 一定不是nil
        print(password as Any,passwordOne)
    }
}
//MARK:15.扩展  扩展类型的属性 扩展类型的方法
extension Int{
    //计算属性
    var kb : Int { return self * 1_024}//千字节
    var mb : Int { return self * 1_024 * 1_024}//兆字节
    var gb : Int { return self * 1_024 * 1_024 * 1_024}//吉字节
}
extension String {
    func prependString (value : String) -> String{
    
        return value + self
    }
    func appendString(value : String) -> String{
    
        return self + value
    }
}
struct XYPoint {
    var x = 0.0
    var y = 0.0
}

extension XYPoint{
    func distance(point:XYPoint)->Double{
        let disX = point.x - self.x
        let disY = point.y - self.y
        return sqrt(disX*disX+disY*disY)
    }
}
//MARK:16.协议:描述方法或属性的骨架，而不是实现   定义 继承 实现
protocol ProtocolName{
   // 协议的成员
}
protocol NewLockUnlockProtocol{
    //get 和 set 是特殊限定符，在协议中同时使用了set和get时，遵循协议的类或结构中，必须使用关键字var来声明相应的变量。如果只使用了get，则在遵循协议的类或结构中，声明变量时，可使用关键字let，也可使用关键字var
    var locked : Bool{get set}
    func lock() -> String
    func unlock() -> String

}
//遵循多个协议
protocol AreaComputationProtocol{
    func computeArea() ->Double
}
protocol PerimeterComputationProtocol{
    func computePerimeter() ->Double
}
struct Rectangle : AreaComputationProtocol,PerimeterComputationProtocol{
    var width,height : Double
    
    func computeArea() -> Double {
        return width * height
    }

    func computePerimeter() -> Double {
        return width * 2 + height * 2
    }
}
