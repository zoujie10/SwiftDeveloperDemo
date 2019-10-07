//
//  NoteBL.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2019/10/5.
//  Copyright © 2019 Zoujie. All rights reserved.
//

import UIKit
protocol NoteBLDelegate {
	func creat(model:Note)
	func remoeve(model:Note)
	func modify(model:Note)
	func findAll()
}

class NoteBL: NSObject,NoteDAODelegate{
	func findAllFinished(list: NSMutableArray) {
		
	}
	
	func findAllFailed(error: NSError) {
		
	}
	
	func findByFinished(model: Note) {
		
	}
	
	func findByFailed(error: NSError) {
		
	}
	
	var delegate : NoteBLDelegate!

}
