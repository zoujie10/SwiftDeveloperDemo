//
//  Schedule.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2020/7/22.
//  Copyright © 2020 Zoujie. All rights reserved.
//

import UIKit

class Schedule: NSObject {
	//编号
	var ScheduleID : Int?
	//比赛日期
	var GameDate : NSString?
	//比赛时间
	var GameTime : NSString?
	//比赛描述
	var GameInfo : NSString?
	//比赛项目
	var Event : Events?
}
