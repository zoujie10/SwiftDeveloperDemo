//
//  NoteBySQLite.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2019/3/18.
//  Copyright © 2019 Zoujie. All rights reserved.
//

import UIKit
import SQLite3
//1.添加libsqlite3.dylib库
class NoteBySQLite : NSObject {
	let DBFILE_NAME = "NotesList.sqlite3"
	var db : OpaquePointer! = nil //这类不透明指针的类型 用来表示那些在 Swift 中无法进行类型描述的 C 指针   seift3  COpaquePointer -> OpaquePointer
	
	// 获得数据库文件路径
	private func applicationDocumentsDirectoryFile() -> String {
		let documentDirectory: NSArray = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
		let path = (documentDirectory[0] as AnyObject).appendingPathComponent("NotesList.plist") as String
		print("path : \(path)")
		return path
	}
	func createEditetableCopyOfDatebaseIfNeeded(){
		let path = self.applicationDocumentsDirectoryFile()
		let cpath = path.cString(using: .utf8)
		
		if(sqlite3_open(cpath!, &db) != SQLITE_OK){
			sqlite3_close(db)
			assert(false,"数据库打开失败")
		
		}else{
				let sql = "CREATE TABLE IF NOT EXISTS Note (cdate TEXT PRIMARY KEY,content TEXT)" //建表
			let cSql = sql.cString(using: .utf8)
			
			if (sqlite3_exec(db, cSql!, nil, nil, nil) != SQLITE_OK){//执行SQL语句，第一个参数是sqlite3指针变量的db的地址，第二个参数是要执行的SQL语句，第三个参数是要回调的函数，第四个参数是要回调的函数的参数，第五个参数是执行出错的字符串
				sqlite3_close(db)
				assert(false,"建表失败")
			}
			sqlite3_close(db)//关闭数据库  释放资源
		}
	}
	
	//MARK:主键查询数据   --> if
	//使用sqlite3_open打开数据库，sqlite3_prepare_v2预处理SQL语句，sqlite3_bind_text绑定参数，sqlite3_step执行SQL语句，遍历结果集，sqlite3_column_text提取字段数据，sqlite3_finalize，sqlite3_close释放资源
	func findBindById(model:Note) ->Note?{
		let path = self.applicationDocumentsDirectoryFile()
		let cpath = path.cString(using: .utf8)
		
		if(sqlite3_open(cpath!, &db) != SQLITE_OK){
			sqlite3_close(db)
			assert(false,"数据库打开失败")
			
		}else{
			let sql = "SELECT cdate,content FROM Note where cdate =?" //? 需要绑定的参数
			let cSql = sql.cString(using: .utf8)
			
			var statement : OpaquePointer! = nil
			
			if sqlite3_prepare_v2(db, cSql!, -1, &statement, nil) == SQLITE_OK{//SQL预处理语句，目的是将SQL编译成二进制代码，提高SQL语句的执行速度，第三个参数代表全部SQL字符串的长度，第四个参数是sqlite3_stmt指针的地址，第五个参数是SQL语句没有执行的部分语句。
				
				let dateFormatter : DateFormatter = DateFormatter()
				dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
				let strDate = dateFormatter.string(from: model.date as Date)
				let cDate = strDate.cString(using: .utf8)
				
				//绑定参数开始
				sqlite3_bind_text(statement, 1, cDate!, -1, nil)
				
				//执行
				if(sqlite3_step(statement) == SQLITE_ROW){
					let bufDate  = UnsafePointer<UInt8>(sqlite3_column_text(statement, 0))
					let strDate = String.init(cString: bufDate!)
					let date : NSDate = dateFormatter.date(from: strDate)! as NSDate
					
					let bufContent = UnsafePointer<UInt8>(sqlite3_column_text(statement, 1))
					let strContent = String.init(cString: bufContent!)
					
					let note = Note(date: date, content: strContent as NSString)
					sqlite3_finalize(statement)//释放语句对象
					sqlite3_close(db)
					
					return note
				}
			}
			
			sqlite3_finalize(statement)
			sqlite3_close(db)
		}
		return nil
	}
	
	
	//MARK:查询所有数据  --- where
	func findAll() -> NSMutableArray{
		let listData = NSMutableArray()
		let path = self.applicationDocumentsDirectoryFile()
		let cpath = path.cString(using: .utf8)
		
		if(sqlite3_open(cpath!, &db) != SQLITE_OK){
			sqlite3_close(db)
			assert(false,"数据库打开失败")
			
		}else{
			
			let sql = "SELECT cdate,content FROM Note"
			let cSql = sql.cString(using: .utf8)
			
			var statement : OpaquePointer! = nil
			
			if sqlite3_prepare_v2(db, cSql!, -1, &statement, nil) == SQLITE_OK{
				
				let dateFormatter : DateFormatter = DateFormatter()
				dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
				
				while sqlite3_step(statement) == SQLITE_OK{
					let bufDate  = UnsafePointer<UInt8>(sqlite3_column_text(statement, 0))
					let strDate = String.init(cString: bufDate!)
					let date : NSDate = dateFormatter.date(from: strDate)! as NSDate
					
					let bufContent = UnsafePointer<UInt8>(sqlite3_column_text(statement, 1))
					let strContent = String.init(cString: bufContent!)
					
					let note = Note(date: date, content: strContent as NSString)
					listData.add(note)
				}
			}
			
			sqlite3_finalize(statement)
			sqlite3_close(db)
		}
		return listData
	}
	
	
	//MARK:插入数据  --- insert
	func create(model:Note) -> Int{
		let path = self.applicationDocumentsDirectoryFile()
		let cpath = path.cString(using: .utf8)
		
		if(sqlite3_open(cpath!, &db) != SQLITE_OK){
			sqlite3_close(db)
			assert(false,"数据库打开失败")
			
		}else{
			
			let sql = "INSERT OR REPLACE INTO note (cdate,content) VALUES (?,?)"
			let cSql = sql.cString(using: .utf8)
		
			var statement : OpaquePointer! = nil
			
			if sqlite3_prepare_v2(db, cSql!, -1, &statement, nil) == SQLITE_OK{
				
				let dateFormatter : DateFormatter = DateFormatter()
				dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
				
				let strDate = dateFormatter.string(from: model.date as Date)
				let cDate = strDate.cString(using: .utf8)
				
				let charTemp = model.content as String
				let cContent = charTemp.cString(using: .utf8)
				
				sqlite3_bind_text(statement, 1, cDate!, -1, nil)
				sqlite3_bind_text(statement, 2, cContent, -1, nil)
				
				//执行插入
				if sqlite3_step(statement) != SQLITE_DONE{
					assert(false,"插入数据失败")
				}
			}
			sqlite3_finalize(statement)
			sqlite3_close(db)
		}
		return 0
	}
	//MARK:删除数据  --- delete
	func remove(model:Note) ->Int{
		let path = self.applicationDocumentsDirectoryFile()
		let cpath = path.cString(using: .utf8)
		
		if(sqlite3_open(cpath!, &db) != SQLITE_OK){
			sqlite3_close(db)
			assert(false,"数据库打开失败")
			
		}else{
			let sql = "DELETE from note where cdate =?"
			let cSql = sql.cString(using: .utf8)
			
			
			var statement : OpaquePointer! = nil
			if sqlite3_prepare_v2(db, cSql!, -1, &statement, nil) == SQLITE_OK{
				let dateFormatter : DateFormatter = DateFormatter()
				dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
				
				let strDate = dateFormatter.string(from: model.date as Date)
				let cDate = strDate.cString(using: .utf8)
				
				//绑定参数开始
				sqlite3_bind_text(statement, 1, cDate!, -1, nil)
				
				//执行插入
				if sqlite3_step(statement) != SQLITE_DONE{
					assert(false,"删除数据失败")
				}
			}
			sqlite3_finalize(statement)
			sqlite3_close(db)
		}
		return 0
	}
	
	//MARK:修改数据  --- update
	func modify(model:Note) -> Int{
		let path = self.applicationDocumentsDirectoryFile()
		let cpath = path.cString(using: .utf8)
		
		if(sqlite3_open(cpath!, &db) != SQLITE_OK){
			sqlite3_close(db)
			assert(false,"数据库打开失败")
			
		}else{
			let sql = "UPDATE note set content=? where cdate =?"
			let cSql = sql.cString(using: .utf8)
			
			var statement : OpaquePointer! = nil
			
			if sqlite3_prepare_v2(db, cSql!, -1, &statement, nil) == SQLITE_OK{
				let dateFormatter : DateFormatter = DateFormatter()
				dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
				
				let strDate = dateFormatter.string(from: model.date as Date)
				let cDate = strDate.cString(using: .utf8)
			
				let charTemp = model.content as String
				let cContent = charTemp.cString(using: .utf8)
				//绑定参数开始
				sqlite3_bind_text(statement, 1, cContent, -1, nil)
				sqlite3_bind_text(statement, 2, cDate!, -1, nil)
				
				//执行插入
				if(sqlite3_step(statement) != SQLITE_DONE){
					assert(false,"修改数据失败。")
				}
			}
			sqlite3_finalize(statement)
			sqlite3_close(db)
		}
		return 0
	}
	
}

