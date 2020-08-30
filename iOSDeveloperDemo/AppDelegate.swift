//
//  AppDelegate.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2018/5/7.
//  Copyright © 2018年 Zoujie. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
	@objc dynamic var appStatus : NSString!//dynamic 运行时动态派发
	var observer : AppStatusObserver!

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.testPatternMethod()
		deviceInfo()
		
		Singleton.sharedInstance.str1 = "User Name"
		print("Login View test data:",Singleton.sharedInstance.str1)
		//读取应用设置 Root.plist
//		let defaults = UserDefaults.standard
//		defaults.string(forKey: "name_preference")
//		defaults.string(forKey: "Name")
		//数据持久化
		handlePlist()
		
		//KVO 监听APP状态
		self.observer = AppStatusObserver()
		self.addObserver(self.observer, forKeyPath: "appStatus", options:[.new,.old], context: nil)
		self.appStatus = "launch"
		
		//TODO 异步初始化数据库 判断数据是否需要更新
		let schemaVersion : UInt64 = 0
		let config = Realm.Configuration(schemaVersion: schemaVersion, migrationBlock: { migration, oldSchemaVersion in
			
			/* 什么都不要做！Realm 会自行检测新增和需要移除的属性，然后自动更新硬盘上的数据库架构 */
			if (oldSchemaVersion < schemaVersion) {}
		})
		Realm.Configuration.defaultConfiguration = config
		Realm.asyncOpen { (realm, error) in
			
			/* Realm 成功打开，迁移已在后台线程中完成 */
			if let _ = realm {
				print("Realm 数据库配置成功")
				
			}
			/* 处理打开 Realm 时所发生的错误 */
			else if let error = error {
				
				print("Realm 数据库配置失败：\(error.localizedDescription)")
			}
		}
		return true
	}
	
	
	func applicationWillResignActive(_ application: UIApplication) {
		// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
		// Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
		self.appStatus = "inactive"
	}

	func applicationDidEnterBackground(_ application: UIApplication) {
		// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
		// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
		self.appStatus = "background"
	}

	func applicationWillEnterForeground(_ application: UIApplication) {
		// Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
		self.appStatus = "inactive"
	}

	func applicationDidBecomeActive(_ application: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
		self.appStatus = "active"
	}

	func applicationWillTerminate(_ application: UIApplication) {
		// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
		self.appStatus = "terminate"
	}
	
	//MARK:国际化读取文本
	func NSlocalizeStrings(){
//		NSLocalizedString(<#T##key: String##String#>, comment: <#T##String#>)
	}
	
	//MARK:访问联系人
	func AccessContactPerson(){
		
	}
    
    func testPatternMethod(){
        let lineEat = subEatLine()
        lineEat.lineToEat()
    }
}




// MARK:重构进持久层中
//	// MARK: - Core Data stack
//	lazy var applicationDocumentsDirectory: NSURL = {
//		// The directory the application uses to store the Core Data store file. This code uses a directory named "lsw.self.MyGraphics" in the application's documents Application Support directory.
//		let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//		return urls[urls.count-1] as NSURL
//	}()
//
//
//	lazy var managedObjectModel: NSManagedObjectModel = { //NSManagedObjectModel 被管理对象模型，是系统中的实体，与数据库中的表等对象对应
//		// The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
////		let modelURL = Bundle.main.url(forResource: "YourDataModelName", withExtension: "momd")!CoreDataNote
//		let modelURL = Bundle.main.url(forResource: "CoreDataNote", withExtension: "momd")! //xcdatamodeld在编译发布时变成momd
//		return NSManagedObjectModel(contentsOf: modelURL)!
//	}()
//
//	lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {//持久化存储协调器类，在持久化对象存储之上提供了一个接口，可以把它考虑成为数据库的连接。
//		// The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
//		// Create the coordinator and store
//		let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
////		let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent("SingleViewCoreData.sqlite"
//		let url = self.applicationDocumentsDirectory.appendingPathComponent("SingleViewCoreData.sqlite")//<xcdatamodeld文件>
//		var error : NSError? = nil
//		var failureReason = "There was an error creating or loading the application's saved data."
//
//		do {
//			try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: nil, options: nil)//NSSQLiteStoreType,NSBinaryStoreType,NSInMemoryStoreType
//		} catch {
//			// Report any error we got.
//			var dict = [String: AnyObject]()
//			dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data" as AnyObject
//			dict[NSLocalizedFailureReasonErrorKey] = failureReason as AnyObject
//
//			dict[NSUnderlyingErrorKey] = error as NSError
//			let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
//			// Replace this with code to handle the error appropriately.
//			// abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//			NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
//			abort()
//		}
//
//		return coordinator
//	}()
//
//	lazy var managedObjectContext: NSManagedObjectContext = { //被管理对象上下文类，在上下文中可以查找、删除和插入对象，然后通过栈同步到持久化对象存储。
//		// Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
//		let coordinator = self.persistentStoreCoordinator
//		var managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
//		managedObjectContext.persistentStoreCoordinator = coordinator
//		return managedObjectContext
//	}()
//
//
//	// MARK: - Core Data Saving support
//	func saveContext () {
//		if managedObjectContext.hasChanges {//managedObjectContext 保存上下文的核心语句
//			do {
//				try managedObjectContext.save()
//			} catch {
//				// Replace this implementation with code to handle the error appropriately.
//				// abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//				let nserror = error as NSError
//				NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
//				abort()
//			}
//		}
//	}


