//
//  QuestionOne.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/8/19.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit
//被问到的一些面试问题
//1.conversion 与 自定义 init 的区别
//2.https与http  http需要三次握手吗
//3.unown关键词 和weak的区别
//4.iOS 系统推送
//5.基础数据类型是否可以指向 指针
//6.will Set,Did Set 和KVO的区别
class QuestionOne: NSObject {
//1 自定义初始化
	
	override init() {
		super.init()
	}
	
	init(data:[String]){

	}
	//便利初始化
	convenience init(index : Int , data : [String]){
		var string = ""
		if(data.count > 1){
			string = "1"
		}else{
			string = "0"
		}
		
		self.init(data: [string])
	}
	
}
extension QuestionOne{
	convenience init(index : Int , data : [String], dic : [String : String]){
		var string = ""
		if(data.count > 1){
			string = "1"
		}else{
			string = "0"
		}
		
		self.init(data: [string])
	}
	
}
/**
 1.convenience 与 自定义 init 的区别
 自定义init 只能调用super.init ，convenience 调用self.init 可以做更多参数的处理,而且还可以放在拓展里
 
 */

/**
 2.https与http  http需要三次握手吗
 三次握手是传输层的概念，HTTPS 通常是 SSL + HTTP 的简称，目前使用的 HTTP/HTTPS 协议是基于 TCP 协议之上的，因此也需要三次握手。要在 TCP 三次握手建立链接之后，才会进行 SSL 握手的过程（即身份认证和密钥协商的过程）。
 TCP 三次握手是确保建立链接，保证双方准备好通信。

 SSL 的目的是加密通信的上层数据。
 */
/**
 3.unown关键词 和weak的区别 Weak代表弱引用。当一个对象被声明为Weak时，表示父层级对该对象没有指向，该对象的引用计数不会增加1.在该对象被释放后，弱引用也随即消失。继续访问该对象，程序会得到nil，不会崩溃。

 Unowned与弱引用的本质一样。唯一不同的是，**对象被释放后，依然有一个无效的引用指向对象，它不是optional，也不指向nil。如果继续访问该对象，则程序就会崩溃。Unowned 是不安全的，除非知道持有对象是存在的。
 */

/**
 
 4.iOS 系统推送 和 第三方 推送的区别
 权限：Background Fetch 后台获取权限
 除了技术实现难度低、统一移动端的推送之外，第三方推送平台的有点之一是能实现更多复杂的功能。


 对于 APNS 官方推送服务来说，它只允许我们推送一个系统通知，用户点击之后跳转到 App 里的某个页面。但第三方推送服务则可以实现更多复杂的操作，比如用户点击通知后直接播放。


 所以我们使用第三方推送的原因就是：

 Android 官方推送的缺陷，我们只能使用第三方推送服务。
 使用第三方推送实现难度低，可以节省成本。
 使用第三方推送能实现更多的复杂功能。统一管理安卓和iOS。
  

 1：OS SDK本身提供的APNs服务器推送，他可以直接推送给目标用户并根据你的方式弹出提示等。
 优点：不论应用是否开启，都会发送到手机端。
 缺点：消息推送的机制是苹果服务端控制，个别时候可能会有延迟，因为苹果服务器也会有队列来处理所有的消息请求。
 2、第三方推送机制，普遍使用Socket机制来实现的，它几乎可以达到及时的发送到目标用户手机端，适用于即时通讯类应用。
 优点：它几乎是实时的，主要取决于它心跳包的节奏。
 缺点：因为iOS系统的限制，应用不能长时间的后台运行，所以在应用关闭的情况下这种推送机制不可用。

 <https://www.cnblogs.com/zyzmlc/p/9321807.html>
 
 */



/**
 6.will Set,Did Set 和KVO的区别
 KVO lets you implement the common “Observer” pattern. With KVO, you can attach any number of observers to a property, at run time, without modifying the source code of the property you're observing.

 Swift's willSet and didSet “observers” are essentially functions that are called before and after a property is set, and have to be written into the property's source code at compile time. They serve a very different purpose than KVO.

 */
