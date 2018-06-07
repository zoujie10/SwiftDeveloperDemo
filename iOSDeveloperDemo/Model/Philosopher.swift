//
//  Philosopher.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2018/6/4.
//  Copyright © 2018年 Zoujie. All rights reserved.
//

import UIKit
protocol PhilosopherDelegate {
	func sleep()
	func eat()
	func work()
}

class Philosopher: NSObject {
	var timer : Timer!
	var count : NSInteger = 0
	var delegate : PhilosopherDelegate?
	
	func start(){
		count = 0
		timer =  Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(handle), userInfo: nil, repeats: true)
	}
	
	@objc func handle(){
		if count == 0{
			self.delegate?.sleep()
			count+=1
		}else if count == 1{
			self.delegate?.eat()
			count+=1
		}else if count == 2{
			self.delegate?.work()
			timer.invalidate()
		}
	}
}






