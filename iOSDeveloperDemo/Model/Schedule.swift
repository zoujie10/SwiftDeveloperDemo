//
//  Schedule.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2020/7/22.
//  Copyright © 2020 Zoujie. All rights reserved.
//

import UIKit

class Schedule : NSObject{
	//Q:"Cannot convert value of type 'Schedule' to expected argument type 'Object
	//https://stackoverflow.com/questions/33115641/swift-cannot-convert-value-of-type-to-expected-argument-in-realm/36658150
	//编号
	@objc dynamic var ScheduleID : Int = 0
	//比赛日期
	@objc dynamic var GameDate : NSString? = ""
	//比赛时间
	@objc dynamic var GameTime : NSString? = ""
	//比赛描述
	@objc dynamic var GameInfo : NSString? = ""
	//比赛项目
	var Event : Events?
}



