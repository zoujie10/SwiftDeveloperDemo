//
//  ViewController.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2018/5/7.
//  Copyright © 2018年 Zoujie. All rights reserved.
//

import UIKit
//import RealmSwift
import SnapKit
class HomeVC: UIViewController,UITextFieldDelegate,UITextViewDelegate,UITableViewDataSource,UITableViewDelegate {
	
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
        self.tabBarController?.hidesBottomBarWhenPushed = true
		if(indexPath.row == 0){
			self.navigationController?.pushViewController(SwiftBasicViewController(), animated: true)
		}else if(indexPath.row == 1){
			self.navigationController?.pushViewController(SwiftAdvanceViewController(), animated: true)
		}else if(indexPath.row == 2){
			self.navigationController?.pushViewController(UIViewAndCALayerVC(), animated: true)
        }else if(indexPath.row == 3){
            self.navigationController?.pushViewController(UIViewControllerVC(), animated: true)
        }else if(indexPath.row == 4){
            self.navigationController?.pushViewController(UIKitComponentVC(), animated: true)
        }else if(indexPath.row == 5){
            self.navigationController?.pushViewController(SwiftListVC(), animated: true)
        }else if(indexPath.row == 6){
            self.navigationController?.pushViewController(SwiftTouchViewAndGestureVC(), animated: true)
        }else if(indexPath.row == 7){
            self.navigationController?.pushViewController(SwiftAnimationSoundVideoVC(), animated: true)
        }else if(indexPath.row == 8){
            self.navigationController?.pushViewController(TextAndImageVC(), animated: true)
        }else if indexPath.row == 9{
            self.navigationController?.pushViewController(AlamofireVC(), animated: true)
        }else if indexPath.row == 10{
            self.navigationController?.pushViewController(SwiftMapKitVC(), animated: true)
        }else if indexPath.row == 11{
            self.navigationController?.pushViewController(SwiftDataPersistenceVC(), animated: true)
        }else if(indexPath.row == 12){
            self.navigationController?.pushViewController(SwiftCocoaPodsVC(), animated: true)
        }else if(indexPath.row == 13){
            self.navigationController?.pushViewController(GitHubManagerVC(), animated: true)
        }else if(indexPath.row == 14){
            self.navigationController?.pushViewController(SwiftThirdPartyVC(), animated: true)
        }else if(indexPath.row == 15){
            self.navigationController?.pushViewController(SwiftImageAndVideoVC(), animated: true)
        }else if(indexPath.row == 16){
            self.navigationController?.pushViewController(SwiftUsuallyDevicesVC(), animated: true)
        }else if indexPath.row == 17 {
            let bigTurnplate = "https://dev-h5.hotkidceo.com/ceo/lotterydraw/index?ordertype=0&id=172"
            let vc = SwiftWebViewAndHTML5VC.init(url: bigTurnplate, webTitle: "webView")
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 18 {
            self.navigationController?.pushViewController(SwiftLocalizationVC(), animated: true)
        }else if indexPath.row == 19 {
            self.navigationController?.pushViewController(SwiftThreadVC(), animated: true)
        }else if indexPath.row == 20 {
            self.navigationController?.pushViewController(SwiftSafeAndEncryptionVC(), animated: true)
        }else if indexPath.row == 21 {
//            let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "stroryboardVC")
            //first page
            let storyboard = UIStoryboard(name: "AnotherStoryboard", bundle: nil)
            let vcRoot = storyboard.instantiateInitialViewController()
            vcRoot?.title = "other board"
            self.navigationController?.pushViewController(vcRoot!, animated: true)

            //other page
//            let vc = UIStoryboard(name: "AnotherStoryboard", bundle: nil).instantiateViewController(withIdentifier: "OtherStoryBoardSecondVC") as! OtherStoryBoardSecondVC //跳转另一个storyboard
//            vc.message = "Jump Success"
//            vc.title = "other board"
//            self.navigationController?.pushViewController(vc, animated: true)
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
//		let realm = try! Realm()
//		//打印出数据库地址
//		print(realm.configuration.fileURL ?? "")
//		try! realm.write{
//			realm.add(Swim)
//		}
//		let swimTags = realm.objects(Schedule.self)

		self.view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.5)
	}
	//MARK: 生命周期
	override func viewDidLoad() {
		super.viewDidLoad()
		self.dataArray = ["1.Swift 基本语法---SwiftBasicViewController",
						  "2.Swift 进阶语法",
						  "3.视图UIView和层CALayer---UIViewAndCALayerVC",
						  "4.ViewController",
						  "5.经典控件",
						  "6.UITableView+UICollectionView",
						  "7.触屏事件和触摸手势",
						  "8.动画声音视频",
                          "9.图文混编",
						  "10.Alamofire",
						  "11.MapKit",
						  "12.数据持久化",
						  "13.Git版本控制实践---GitHubManagerVC",
                          "14.CocoaPods",
                          "15.数据解析",
                          "16.图片和视频处理",
                          "17.常用设备使用",
                          "18.WKWebViewAndHTML5",
                          "19.Localization",
                          "20.多线程",
                          "21.加密与安全",
                          "22.Storyboard"]
	
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
	
	
	@objc func registerCompletion(notification: Notification){
		
		let theDate : NSDictionary = notification.userInfo! as NSDictionary
		let userID = theDate.object(forKey: "userID")
        print(userID as Any)
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

