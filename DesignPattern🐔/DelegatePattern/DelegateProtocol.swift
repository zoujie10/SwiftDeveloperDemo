//
//  DelegateProtocol.swift
//  iOSDeveloperDemo
//
//  Created by 邹杰 on 5/14/19.
//  Copyright © 2019 Zoujie. All rights reserved.
//

import Foundation
//实现多继承
//NSProxy

protocol delegateProtocol {
	func doSomeThingFirst()
	func doSomeThingSecond() -> String
	
}

class manloadClass: NSObject {
	
}

