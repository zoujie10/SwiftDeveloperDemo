//
//  NoteByArchiver.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2018/6/13.
//  Copyright © 2018年 Zoujie. All rights reserved.
//

import UIKit

class NoteByArchiver: NSObject {
	let FILE_NAME = "NotesList.archive"
	let ARCHIVE_KEY = "NotesList"
	var ArchiverfilePath : String = String()
	var listData : NSMutableArray!
	
	private	func ArchiverToApplicationDocumentsDirectoryFile() -> String{
		let documentDirectory : NSArray = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
		//添加plist文件路径
		let path = (documentDirectory[0] as AnyObject).appendingPathComponent(FILE_NAME) as String
		//		let filePath:String = NSHomeDirectory() + "/Documents/NoteList.plist"
		
		let plistTemp = UserDefaults.standard.object(forKey: "ArchiverfilePath")
		
		if plistTemp == nil {
			let array = NSArray()
			array.write(toFile: path, atomically: true)
			ArchiverfilePath = path
			UserDefaults.standard.setValue(ArchiverfilePath, forKey: "PlistfilePath")
		}else{
			ArchiverfilePath = path
		}
		return path
	}
	
	
	func ArchiverToCreatEditableCopyOfDatabaseIfNeed(){
		let fileManager = FileManager.default
		let writableDBPath = self.ArchiverToApplicationDocumentsDirectoryFile()
		
		let dbexits = fileManager.fileExists(atPath: writableDBPath)
		
		if dbexits != true {
			//test data
			let dateFomatter = dateFomatterMethod()
			
			let date1 : NSDate = dateFomatter.date(from: "2018-06-15 23:00:00")! as NSDate
			let note1 : Note  = Note.init(date: date1, content: "Welcome 2018 World Cup")
			
			let date2 : NSDate = dateFomatter.date(from: "2018-06-15 23:00:01")! as NSDate
			let note2 : Note = Note.init(date: date2, content: "First Match")
			
			self.listData = NSMutableArray()
			self.listData.add(note1)
			self.listData.add(note2)
			
			let array = NSMutableArray()
			array.add(note1)
			array.add(note2)
			
			let theData = NSMutableData()
			let archiver = NSKeyedArchiver(forWritingWith: theData)
			archiver.encode(array, forKey: ARCHIVE_KEY)
			archiver.finishEncoding()
			
			theData.write(toFile: writableDBPath, atomically: true)
		}
	}
	
	public func ArchiverCreat(model:Note){
		let path = self.ArchiverToApplicationDocumentsDirectoryFile()
		let array = self.ArchiverFindAll()
		array.add(model)
		
		let theData = NSMutableData()
		let archiver = NSKeyedArchiver(forWritingWith: theData)
		archiver.encode(array, forKey: ARCHIVE_KEY)
		archiver.finishEncoding()
		theData.write(toFile:path, atomically: true)
		
	}
	
	public func ArchiverRemove(model : Note){
//		let dateFomatter = dateFomatterMethod()
		let path = self.ArchiverToApplicationDocumentsDirectoryFile()
		let array = self.ArchiverFindAll()
		
		for item in array{
			let note = item as! Note
			
			if note.date == model.date{
				array.remove(note)
			
				let theData = NSMutableData()
				let archiver = NSKeyedArchiver(forWritingWith: theData)
				archiver.encode(array, forKey: ARCHIVE_KEY)
				archiver.finishEncoding()
				theData.write(toFile:path, atomically: true)
				break
			}
		}
	}
	
	public func ArchiverModify(model : Note){
		let path = self.ArchiverToApplicationDocumentsDirectoryFile()
		let array = self.ArchiverFindAll()
		
		for item in array{
			let note = item as! Note
			
			if model.date == note.date{
				note.content = model.content
				
				let theData = NSMutableData()
				let archiver = NSKeyedArchiver(forWritingWith: theData)
				archiver.encode(array, forKey: ARCHIVE_KEY)
				archiver.finishEncoding()
				theData.write(toFile:path, atomically: true)
				break
			}
		}
	}
	
	
	public func ArchiverFindAll() -> NSMutableArray{
		let path = self.ArchiverToApplicationDocumentsDirectoryFile()
		var listData = NSMutableArray()
		let theData = NSData(contentsOfFile: path)!
		
		if theData.length > 0 {
			let archiver = NSKeyedArchiver(forWritingWith: theData as! NSMutableData)
			listData = archiver.decodeObject(forKey: ARCHIVE_KEY) as! NSMutableArray
			archiver.finishEncoding()
		}
		return listData
	}
	
	public func ArchiverFindById(model : Note) ->Note?{
		let path = self.ArchiverToApplicationDocumentsDirectoryFile()
		var listData = NSMutableArray()
		let theData = NSData(contentsOfFile: path)!
		
		if theData.length > 0 {
			let archiver = NSKeyedUnarchiver(forReadingWith: theData as Data)
			listData = archiver.decodeObject(forKey: ARCHIVE_KEY) as! NSMutableArray
			archiver.finishDecoding()
			
			for item in listData{
				let note = item as! Note
				
				if note.date == model.date{
					return note
				}
			}
		}
		return nil
	}
}
