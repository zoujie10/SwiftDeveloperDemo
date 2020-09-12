//
//  ViewController.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2018/5/7.
//  Copyright © 2018年 Zoujie. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate {
	var changeTag = Bool()
	
	@IBOutlet var DisplayLB: UILabel!
	@IBOutlet var NameLb: UILabel!
	
	@IBOutlet var DisPlayTextView: UITextView!
	@IBOutlet var InputNameTextField: UITextField!
	@IBOutlet var AbstractLB: UILabel!
	@IBOutlet var Dils: UILabel!
	
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
		let swimTags = realm.objects(Schedule.self)
		for i in 0..<5 {
			let swim = swimTags[i]
			// ...
			self.Dils.text = swim.GameDate as String?
		}

		self.view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.5)
	}
	@IBAction func OKBtn(_ sender: UIButton) {
		if changeTag == true{
			DisplayLB.text = "Hello"
			DisplayLB.backgroundColor = UIColor.brown
			changeTag = false
		}else{
			DisplayLB.text = "GoodBye"
			DisplayLB.backgroundColor = UIColor.blue
			changeTag = true
		}
//		self.present(TextViewController(), animated: true) {
//				print("Jump TextViewController")
//		}
	}
	//MARK: 生命周期
	override func viewDidLoad() {
		super.viewDidLoad()
		changeTag = true
		
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
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	@objc func registerCompletion(notification: Notification){
		
		let theDate : NSDictionary = notification.userInfo! as NSDictionary
		let userID = theDate.object(forKey: "userID")
		DisplayLB.text = userID as? String
		
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
		InputNameTextField.text = nil
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

