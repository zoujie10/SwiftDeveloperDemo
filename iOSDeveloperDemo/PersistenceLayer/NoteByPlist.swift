//
//  NoteByPlist.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2018/6/11.
//  Copyright © 2018年 Zoujie. All rights reserved.
//

import UIKit

extension String {
	func stringByAppendingPathComponent(path: String) -> String {
		let nsSt = self as NSString
		return nsSt.appendingPathComponent(path)
	}
}

public func handlePlist(){
	let dateFomatter : DateFormatter = DateFormatter()
	dateFomatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
	let datetest = dateFomatter.date(from: "2017-06-28 16:10:17")
	let NoteTest = Note(date: datetest! as NSDate, content: "添加第4条")
	
	
	let one = NoteByPlist()
	//		one.createEditableCopyOfDatabaseIfNeeded()
	one.create(model: NoteTest)
	let arr = one.findAll()
	print(arr)
//		one.remove(model: NoteTest)
//	one.findAll()
//	one.findById(model: NoteTest)
}

class NoteByPlist: NSObject {
	
	var PlistfilePath : String = String()
	
	private	func applicationDocumentsDirectoryFile() -> String{
		let documentDirectory : NSArray = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
		//添加plist文件路径
		let path = (documentDirectory[0] as AnyObject).appendingPathComponent("NoteList.plist") as String
//		let filePath:String = NSHomeDirectory() + "/Documents/NoteList.plist"
		
		let plistTemp = UserDefaults.standard.object(forKey: "PlistfilePath")
		
		if plistTemp == nil {
			let array = NSArray()
			array.write(toFile: path, atomically: true)
			PlistfilePath = path
			UserDefaults.standard.setValue(PlistfilePath, forKey: "PlistfilePath")
		}else{
			PlistfilePath = path
		}
		return path
	}
	//end
	
	func dateFomatterMethod() -> DateFormatter{
		let dateFomatter : DateFormatter = DateFormatter()
		dateFomatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
		return dateFomatter
	}
	
	
	func createEditableCopyOfDatabaseIfNeeded(){
		let fileManager = FileManager.default
		let writableDBPath = PlistfilePath
		let dbexits = fileManager.fileExists(atPath: writableDBPath)
		if dbexits != true{  //文件不存在的时候重新添加
//			let defaultDBPath = Bundle.main.resourcePath as String?
//			let documentDirectory : NSArray = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
//			let defaultDBPath =  (documentDirectory[0] as AnyObject).appendingPathComponent("NoteList.plist") as String
//			let dbFile = defaultDBPath?.stringByAppendingPathComponent(path:"NoteList.plist") as! String
			let filePath:String = NSHomeDirectory() + "/Documents/NoteList.plist"
			let array = NSArray()//空plist文件
			array.write(toFile: filePath, atomically: true)
			
			do {
				try fileManager.copyItem(atPath: filePath, toPath: writableDBPath)
			} catch let error as NSError{
				print("something wrong:\(error)")
			}
		}
	}
	
	public func create(model : Note){
		
		let dateFomatter : DateFormatter = self.dateFomatterMethod()
		var path : String
		if PlistfilePath.isEmpty{
			path = self.applicationDocumentsDirectoryFile()
		}else{
			path = PlistfilePath
		}

		let array = NSMutableArray(contentsOfFile: path)!//path获取目录中的文件时，文件必须已存在
		let strDate = dateFomatter.string(from: model.date as Date)
		let dict = NSDictionary(objects: [strDate,model.content], forKeys: ["date" as NSCopying,"content" as NSCopying])
		array.add(dict)
		array.write(toFile: path, atomically: true)
		
	}
	
	public func remove(model : Note) -> Int{
		let dateFomatter : DateFormatter = self.dateFomatterMethod()
		
		let path = self.applicationDocumentsDirectoryFile()
		let array = NSMutableArray(contentsOfFile: path)!
		
		for item in array{
			let dict = item as! NSDictionary
			let strDate = dict["date"] as! String
			
			let date = dateFomatter.date(from: strDate)
			
			if date == model.date as Date{
				array.remove(dict)
				array.write(toFile: path, atomically: true)
				break
			}
		}
		
		return 0
	}
	
	public func modify(model : Note) -> Int{
		let dateFomatter : DateFormatter = self.dateFomatterMethod()
		
		let path = self.applicationDocumentsDirectoryFile()
		let array = NSMutableArray(contentsOfFile: path)!
		
		for item in array{
			let dict = item as! NSDictionary
			let strDate = dict["date"] as! String
			let date = dateFomatter.date(from: strDate)
			_ = dict["content"] as! String
			
			if date == model.date as Date{
				dict.setValue(model.content, forKey: "content")
				array.write(toFile: path, atomically: true)
				break
			}
		}
		return 0
	}
	
	public func findAll() -> NSMutableArray{
		let dateFomatter : DateFormatter = self.dateFomatterMethod()
		let path = PlistfilePath
		let array = NSMutableArray(contentsOfFile: path)!
		
		let listData = NSMutableArray()
		
		for item in array{
			let dict = item as! NSDictionary
			let strDate = dict["date"] as! String
			let date = dateFomatter.date(from: strDate)!
			let content = dict["content"] as! String
			
			let note = Note(date: date as NSDate, content: content as NSString)
			listData.add(note)
		}
		return listData
	}
	
	public func findById(model : Note) -> Note?{
		let dateFomatter : DateFormatter = self.dateFomatterMethod()
		let path = self.applicationDocumentsDirectoryFile()
		let array = NSMutableArray(contentsOfFile: path)!
		
		for item in array{
			let dict = item as! NSDictionary
			let strDate = dict["date"] as! String
			let date = dateFomatter.date(from: strDate)!
			let content = dict["content"] as! String
			
			if date == model.date as Date{
				let note = Note(date: date as NSDate, content: content as NSString)
				return note
			}
			
		}
		return nil
	}
	

}


