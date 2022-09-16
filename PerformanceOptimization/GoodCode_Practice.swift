//
//  GoodCode_Practice.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/9/2.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class GoodCode_Practice: NSObject {

}

/* MARK:  1.使用自定义类型代替Dictionary

 代码中大量Dictionary数据结构会降低代码可维护性，同时带来潜在的bug：

 key需要字符串硬编码，编译时无法检查
 value没有类型限制。修改时类型无法限制，读取时需要重复类型转换和解包操作
 无法利用空安全特性，指定某个属性必须有值
 提示：自定义类型还有个好处，例如JSON转自定义类型时会进行类型/nil/属性名检查，可以避免将错误数据丢到下一层。
 
 不推荐

 let dic: [String: Any]
 let num = dic["value"] as? Int
 dic["name"] = "name"
 
 推荐

 struct Data {
   let num: Int
   var name: String?
 }
 let num = data.num
 data.name = "name"
 
 适合使用Dictionary的场景

 数据不使用 - 数据并不读取只是用来传递。
 解耦 - 1.组件间通信解耦使用HashMap传递参数进行通信。2.跨技术栈边界的场景，混合栈间通信/前后端通信使用HashMap/JSON进行通信。
 */


/* MARK: 2 控制流 使用filter/reduce/map代替for循环
使用filter/reduce/map可以带来很多好处，包括更少的局部变量，减少模板代码，代码更加清晰，可读性更高。

 不推荐
 let nums = [1, 2, 3]
 var result = []
 for num in nums {
	 if num < 3 {
		 result.append(String(num))
	 }
 }
 // result = ["1", "2"]
 复制代码
 推荐

 let nums = [1, 2, 3]
 let result = nums.filter { $0 < 3 }.map { String($0) }
 // result = ["1", "2"]
 **/

/* MARK: 3 使用三元运算符?:
 推荐

 let b = true
 let a = b ? 1 : 2

 不推荐

 var a: Int?
 if b {
	 a = 1
 } else {
	 a = 2
 }
 **/

/* MARK: 4 使用guard进行提前返回
 
 推荐

 guard !a else {
	 return
 }
 guard !b else {
	 return
 }
 // do
 复制代码
 不推荐

 if a {
	 if b {
		 // do
	 }
 }
 
 **/

/* MARK: 5 使用weak/unowned避免循环引用,减少使用unowned
 
 resource.request().onComplete { [weak self] response in
   guard let self = self else {
	 return
   }
   let model = self.updateModel(response)
   self.updateUI(model)
 }

 resource.request().onComplete { [unowned self] response in
   let model = self.updateModel(response)
   self.updateUI(model)
 }
 

 unowned在值不存在时会产生运行时异常导致Crash，只有在确定self一定会存在时才使用unowned。

 class Class {
	 @objc unowned var object: Object
	 @objc weak var object: Object?
 }
 
 unowned/weak区别：

 weak - 必须设置为可选值，会进行弱引用处理性能更差。会自动设置为nil
 unowned - 可以不设置为可选值，不会进行弱引用处理性能更好。但是不会自动设置为nil, 如果self已释放会触发错误.
 引起崩溃。
 */
/* MARK: 6 使用for where优化循环
 
 for循环添加where语句，只有当where条件满足时才会进入循环

 不推荐

 for item in collection {
   if item.hasProperty {
	 // ...
   }
 }

 
 推荐

 for item in collection where item.hasProperty {
   // item.hasProperty == true，才会进入循环
 }
 */

/* MARK: 7 使用defer
 
 defer可以保证在函数退出前一定会执行。可以使用defer中实现退出时一定会执行的操作例如资源释放等避免遗漏。

 func method() {
	 lock.lock()
	 defer {
		 lock.unlock()
		 // 会在method作用域结束的时候调用
	 }
	 // do
 }
 
 
 */
/* MARK: 8 字符串 使用"""

在定义复杂字符串时，使用多行字符串字面量可以保持原有字符串的换行符号/引号等特殊字符，不需要使用\进行转义。

let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely,
"and go on till you come to the end; then stop."
"""

提示：上面字符串中的""和换行可以自动保留。
 */

/* MARK: 9 使用字符串插值

使用字符串插值可以提高代码可读性。

不推荐

let multiplier = 3
let message = String(multiplier) + "times 2.5 is" + String((Double(multiplier) * 2.5))
复制代码
推荐

let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
*/

/* MARK: 10 函数  使用参数默认值

 使用参数默认值，可以使调用方传递更少的参数。

 不推荐

 func test(a: Int, b: String?, c: Int?) {
 }
 test(1, nil, nil)
 复制代码
 推荐

 func test(a: Int, b: String? = nil, c: Int? = nil) {
 }
 test(1)
 复制代码
 提示：相比ObjC，参数默认值也可以让我们定义更少的方法。
 */
/* MARK: 11  使用@discardableResult
 某些方法使用方并不一定会处理返回值，可以考虑添加@discardableResult标识提示Xcode允许不处理返回值不进行warning提示。

 // 上报方法使用方不关心是否成功
 func report(id: String) -> Bool {}

 @discardableResult func report2(id: String) -> Bool {}

 report("1") // 编译器会警告
 report2("1") // 不处理返回值编译器不会警告
 */

/* MARK: 12  系统库   KVO/Notification 使用 block API

 block API的优势：

 KVO 可以支持 KeyPath
 不需要主动移除监听，observer释放时自动移除监听
 不推荐

 class Object: NSObject {
   init() {
	 super.init()
	 addObserver(self, forKeyPath: "value", options: .new, context: nil)
	 NotificationCenter.default.addObserver(self, selector: #selector(test), name: NSNotification.Name(rawValue: ""), object: nil)
   }

   override class func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
   }

   @objc private func test() {
   }

   deinit {
	 removeObserver(self, forKeyPath: "value")
	 NotificationCenter.default.removeObserver(self)
   }

 }
 */
/* MARK: 13 - Protocol

 使用protocol代替继承

 Swift中针对protocol提供了很多新特性，例如默认实现，关联类型，支持值类型。在代码设计时可以优先考虑使用protocol来避免臃肿的父类同时更多使用值类型。

 提示：一些无法用protocol替代继承的场景：1.需要继承NSObject子类。2.需要调用super方法。3.实现抽象类的能力
 */
