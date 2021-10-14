//
//  CopyObject.swift
//  iOSDeveloperDemo
//
//  Created by 邹杰 on 6/10/19.
//  Copyright © 2019 Zoujie. All rights reserved.
//

import UIKit

class CopyObject: NSObject {

}
//实现深拷贝
/**
let personOne = Person.init(name: "SB", age: 10)
let personCopy : Person = personOne.copy()
personCopy.age = 1
print(personCopy,personOne)
*/
class Person: NSObject,NSCopying {
	func copy(with zone: NSZone? = nil) -> Any {
		let copyPerson = type(of: self).init(name: self.name, age: self.age)
		return copyPerson
	}
	
	var name : String = ""
	public var age : Int = 0
	required init(name : String , age : Int) {
		self.name = name
		self.age = age
	}
	
	func copy(with zone: NSZone? = nil) -> Person {
		let copyPerson : Person = type(of: self).init(name: self.name, age: self.age)
		return copyPerson
	}
}
