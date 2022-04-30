//
//  CopyPatternDelegate.swift
//  iOSDeveloperDemo
//
//  Created by 邹杰 on 6/10/19.
//  Copyright © 2019 Zoujie. All rights reserved.
//

import UIKit
/*
 1.深拷贝vs浅拷贝  值拷贝，开辟新的内存。可变类型属性用copy修饰，防止数据篡改。浅拷贝，指针拷贝，一个指针指向同一个地址，容易出现篡改数据。
 2.系统实现的原型模式  NSCopying
 */
protocol CopyPatternDelegate{
    func copyMethod(object:Any) -> Any
    func deepCopyMethod(object:Any) -> Any
}

