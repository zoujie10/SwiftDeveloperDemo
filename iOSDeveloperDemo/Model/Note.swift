//
//  Note.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2018/6/11.
//  Copyright © 2018年 Zoujie. All rights reserved.
//

import UIKit

public class Note : NSObject,NSCoding{
	public func encode(with aCoder: NSCoder) {
		aCoder.encode(date, forKey: "date")
		aCoder.encode(content, forKey: "content")
	}
	
	public required init?(coder aDecoder: NSCoder) {
		self.date = aDecoder.decodeObject(forKey: "date") as! NSDate
		self.content = aDecoder.decodeObject(forKey: "content") as! NSString
	}
	
	public var date : NSDate
	public var content : NSString
	
	public init(date:NSDate,content:NSString){
		self.date = date
		self.content = content
	}
	
	
}
