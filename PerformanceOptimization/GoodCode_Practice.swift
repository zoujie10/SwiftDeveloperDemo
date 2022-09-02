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

/**
 1.使用自定义类型代替Dictionary

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
