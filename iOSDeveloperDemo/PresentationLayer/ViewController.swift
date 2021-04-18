//
//  ViewController.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2018/5/7.
//  Copyright © 2018年 Zoujie. All rights reserved.
//

import UIKit
import RealmSwift
import SnapKit
class ViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate,UITableViewDataSource,UITableViewDelegate {
	
	//MARK: UITableview data source
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.dataArray.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		cell.textLabel?.text = (self.dataArray[indexPath.row] as! String)
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print(self.dataArray[indexPath.row])
		if(indexPath.row == 0){
			self.navigationController?.pushViewController(SwiftBasicViewController(), animated: true)
//			self.present(SwiftBasicViewController(), animated: true, completion: nil)
		}else if(indexPath.row == 1){
			self.navigationController?.pushViewController(SwiftAdvanceViewController(), animated: true)
		}else if(indexPath.row == 2){
			self.navigationController?.pushViewController(UIViewAndCALayerVC(), animated: true)
		}
	}
	
	
	var dataArray = NSArray()
	var tableView = UITableView()

	@IBAction func clickSaveData(_ sender: UIButton) {
		
		let Swim = Schedule()
		Swim.ScheduleID = 1111
		Swim.GameDate = "2020.08.08"
		Swim.GameTime = "16:00"
		Swim.GameInfo = "游泳"
		Swim.Event?.EventID = 01
		//		写入数据库
		let realm = try! Realm()
		//打印出数据库地址
		print(realm.configuration.fileURL ?? "")
		try! realm.write{
			realm.add(Swim)
		}
//		let swimTags = realm.objects(Schedule.self)

		self.view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.5)
	}
	//MARK: 生命周期
	override func viewDidLoad() {
		super.viewDidLoad()
		self.dataArray = ["Swift 基本语法---SwiftBasicViewController",
						  "Swift 进阶语法",
						  "视图UIView和层CALayer---UIViewAndCALayerVC",
						  "ViewController",
						  "经典控件",
						  "UITableView",
						  "UICollectionView",
						  "触屏事件和触摸手势",
						  "动画声音视频",
						  "Alamofire",
						  "WKWebView与HTML5",
						  "数据持久化",
						  "Git版本控制实践---GitHubManagerVC"]
	
		self.view.addSubview(self.tableView)
		self.tableView.snp.makeConstraints { (make) in
			make.edges.equalTo(self.view)
		}
		self.tableView.dataSource = self;
		self.tableView.delegate = self;
		self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
	}
	
	func notiMethod(){
		//注册通知
			let notificationCenter = NotificationCenter.default
			notificationCenter.addObserver(self, selector:#selector(registerCompletion(notification:)), name:NSNotification.Name(rawValue: "RegisterCompletionNotification"), object: nil)
			//监听系统通知
			notificationCenter.addObserver(self, selector:#selector(handleEnterBackground), name: NSNotification.Name.UIApplicationDidEnterBackground, object: nil)
			notificationCenter.addObserver(self, selector:#selector(handleEnterForeground), name: NSNotification.Name.UIApplicationWillEnterForeground, object: nil)
			//监听内存警告⚠️
			notificationCenter.addObserver(self, selector:#selector(handleMemoryWarning), name: NSNotification.Name.UIApplicationDidReceiveMemoryWarning, object: nil)
	}
	override func viewWillAppear(_ animated: Bool) {
		
	}
	override func viewWillDisappear(_ animated: Bool) {
		
	}
	
	@objc func registerCompletion(notification: Notification){
		
		let theDate : NSDictionary = notification.userInfo! as NSDictionary
		let userID = theDate.object(forKey: "userID")
	
		
	}
	
	@objc func handleEnterBackground(){
		print("Background")
	}
	
	@objc func handleEnterForeground(){
		print("Foreground")
	}
	@objc func handleMemoryWarning(){
		print("Warning ----- Noti")
	}
	//MARK: 协议
	func textFieldShouldClear(_ textField: UITextField) -> Bool {
		
		print("clear all input Info")
		return true
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
	
	func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
		if text == "\n"{
			textView.resignFirstResponder()
			return false
		}
		return true
	}
	
	
}

