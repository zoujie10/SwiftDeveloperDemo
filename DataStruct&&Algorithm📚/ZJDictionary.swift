//
//  ZJDictionary.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2018/8/31.
//  Copyright © 2018年 Zoujie. All rights reserved.
//

import UIKit

class ZJDictionary: NSObject {
	public func stringCharacters(string : String) {
		let result = Dictionary(string.map{($0,1)},uniquingKeysWith: +)
		print(result.count,result.endIndex.hashValue)
	}
}
