//
//  Note.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2018/6/11.
//  Copyright © 2018年 Zoujie. All rights reserved.
//

import UIKit

public class Note {
	public var date : NSDate
	public var content : NSString
	
	public init(date:NSDate,content:NSString){
		self.date = date
		self.content = content
	}
}
