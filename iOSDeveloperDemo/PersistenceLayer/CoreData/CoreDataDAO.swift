//
//  CoreDataDAO.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2019/3/30.
//  Copyright © 2019 Zoujie. All rights reserved.
//


/*
数据持久层
CoreDataDAO   DAO基类
NoteDAO  NoteDAO类
Note    未被管理的实体类
NoteManagedObject 被管理的实体类
*/

import UIKit
import CoreData

class CoreDataDAO: NSObject {
		// MARK: - Core Data stack
		//返回应用程序Docments目录的NSURL类型
		lazy var applicationDocumentsDirectory: NSURL = {
			// The directory the application uses to store the Core Data store file. This code uses a directory named "lsw.self.MyGraphics" in the application's documents Application Support directory.
			let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
			return urls[urls.count-1] as NSURL
		}()
	
		//返回被管理的对象模型
		lazy var managedObjectModel: NSManagedObjectModel = { //NSManagedObjectModel 被管理对象模型，是系统中的实体，与数据库中的表等对象对应
			// The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
	//		let modelURL = Bundle.main.url(forResource: "YourDataModelName", withExtension: "momd")!CoreDataNote
			let modelURL = Bundle.main.url(forResource: "CoreDataNote", withExtension: "momd")! //xcdatamodeld在编译发布时变成momd
			return NSManagedObjectModel(contentsOf: modelURL)!
		}()
	
		//返回持久化存储协调者
		lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {//持久化存储协调器类，在持久化对象存储之上提供了一个接口，可以把它考虑成为数据库的连接。
			// The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
			// Create the coordinator and store
			let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
	//		let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent("SingleViewCoreData.sqlite"
			var pragmaOptions = NSMutableDictionary()
			let string : NSString = "synchronous"
			pragmaOptions.setObject("OFF", forKey:string)
			let storeOptions = NSDictionary(object: pragmaOptions, forKey: NSSQLitePragmasOption as NSString)
			
			let url = self.applicationDocumentsDirectory.appendingPathComponent("SingleViewCoreData.sqlite")//<xcdatamodeld文件>
			var error : NSError? = nil
			var failureReason = "There was an error creating or loading the application's saved data."
	
			do {
				try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: nil, options: (storeOptions as! [AnyHashable : Any]))//NSSQLiteStoreType,NSBinaryStoreType,NSInMemoryStoreType
			} catch {
				// Report any error we got.
				var dict = [String: AnyObject]()
				dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data" as AnyObject
				dict[NSLocalizedFailureReasonErrorKey] = failureReason as AnyObject
	
				dict[NSUnderlyingErrorKey] = error as NSError
				let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
				// Replace this with code to handle the error appropriately.
				// abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
				NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
				abort()
			}
	
			return coordinator
		}()
	
		lazy var managedObjectContext: NSManagedObjectContext = { //被管理对象上下文类，在上下文中可以查找、删除和插入对象，然后通过栈同步到持久化对象存储。
			// Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
			let coordinator = self.persistentStoreCoordinator
			var managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
			managedObjectContext.persistentStoreCoordinator = coordinator
			return managedObjectContext
		}()
	
	
		// MARK: - Core Data Saving support
		func saveContext () {
			if managedObjectContext.hasChanges {//managedObjectContext 保存上下文的核心语句
				do {
					try managedObjectContext.save()
				} catch {
					// Replace this implementation with code to handle the error appropriately.
					// abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
					let nserror = error as NSError
					NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
					abort()
				}
			}
		}
	
	
	//查询数据
	//1.无条件查询
	func findAll()->NSMutableArray{
		let cxt = self.managedObjectContext
		let entity = NSEntityDescription.entity(forEntityName: "Note", in: cxt)
		
		let fetchRequest = NSFetchRequest<NSFetchRequestResult>()//数据提取请求类，用于查询
		fetchRequest.entity = entity;//实体描述设定到请求对象中
		
		let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
		let sortDescriptors : NSArray =  NSArray(objects: sortDescriptor)
		
		fetchRequest.sortDescriptors = (sortDescriptors as! [NSSortDescriptor])
//		var error : NSError? = nil
		let resListData = NSMutableArray()
		do{
			let listData = try cxt.fetch(fetchRequest) as NSArray
			
			for item in listData{
				let mo = item as! NSManagedObject
				let date = mo.value(forKey: "date") as! NSDate
				let content = mo.value(forKey: "content") as! NSString
				let note = Note(date: date, content: content)
				resListData.add(note)
			}
		}catch{
			
		}
		return resListData
	}
	//2.有条件查询
	func findById(model:Note) -> Note? {
		let cxt = self.managedObjectContext
		let entity = NSEntityDescription.entity(forEntityName: "Note", in: cxt)
		
		let fetchRequest = NSFetchRequest<NSFetchRequestResult>()//数据提取请求类，用于查询
		fetchRequest.entity = entity;//实体描述设定到请求对象中
		
		fetchRequest.predicate = NSPredicate(format: "date = %@", model.date)//NSPredicate定义一个逻辑查询条件，在内存中过滤集合对象
		
		do{
			let listData = try cxt.fetch(fetchRequest) as NSArray
			
			if listData.count > 0 {
				let mo = listData.lastObject as! NSManagedObject
				let date = mo.value(forKey: "date") as! NSDate
				let content = mo.value(forKey: "content") as! NSString
				let note = Note(date: date, content: content)
				return note
			}
		}catch{
			
		}
		return nil
	}
	
	//修改数据  insert update delete
	func creat(model:Note) throws -> Int{
		let cxt = self.managedObjectContext
		
		let note = NSEntityDescription.insertNewObject(forEntityName: "Note", into: cxt) as NSManagedObject
		note.setValue(model.date, forKey: "date")
		note.setValue(model.content, forKey: "content")
		
		if cxt.hasChanges {//判断数据是否有变化
			try cxt.save()//保存数据变化
			return -1
		}
		return 0
	}
	
	//删除数据
	func remove(model:Note) throws -> Int{
		let cxt = self.managedObjectContext
		let entity = NSEntityDescription.entity(forEntityName: "Note", in: cxt)
		
		let fetchRequest = NSFetchRequest<NSFetchRequestResult>()//数据提取请求类，用于查询
		fetchRequest.entity = entity;//实体描述设定到请求对象中
		fetchRequest.predicate = NSPredicate(format: "date = %@", model.date)//NSPredicate定义一个逻辑查询条件，在内存中过滤集合对象
		
		
			let listData = try cxt.fetch(fetchRequest) as NSArray
		
			if listData.count > 0 {
				let note = listData.lastObject as! NSManagedObject
				cxt.delete(note)
				if cxt.hasChanges {//判断数据是否有变化
					
					try cxt.save()//保存数据变化
					return -1
				}
			}
		
		return 0
	}
	
	func modify(model:Note) throws -> Int{
		let cxt = self.managedObjectContext
		let entity = NSEntityDescription.entity(forEntityName: "Note", in: cxt)
		
		let fetchRequest = NSFetchRequest<NSFetchRequestResult>()//数据提取请求类，用于查询
		fetchRequest.entity = entity;//实体描述设定到请求对象中
		fetchRequest.predicate = NSPredicate(format: "date = %@", model.date)//NSPredicate定义一个逻辑查询条件，在内存中过滤集合对象
		
		
		let listData = try cxt.fetch(fetchRequest) as NSArray
		
		if listData.count > 0 {
			let note = listData.lastObject as! NSManagedObject
			note.setValue(model.content, forKey: "content")
			
			if cxt.hasChanges{//判断数据是否有变化
				try cxt.save()//保存数据变化
				return -1
			}
		}
		
		return 0
	}
}
//Swift 中的 Error Handling   https://swift.gg/2018/05/31/error-handling-swift/   do catch



