//
//  RegisterViewController.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2018/5/28.
//  Copyright © 2018年 Zoujie. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
	
	@IBOutlet var UserIdInPutTextField: UITextField!
	
	@IBAction func SaveAction(_ sender: UIBarButtonItem) {
		
		self.dismiss(animated: true) {
			print("点击保存返回登录界面")
			
			let dataDic = NSDictionary(object: self.UserIdInPutTextField.text as Any, forKey: "userID" as NSCopying)
			
			NotificationCenter.default.post(name: NSNotification.Name(rawValue: "RegisterCompletionNotification"), object: nil, userInfo: (dataDic as! [AnyHashable : Any]))
		}
		
	}

	@IBAction func CancelAction(_ sender: UIBarButtonItem) {
//		self.dismiss(animated: true) {
//
//		}
		self.dismiss(animated: true,completion:{
			print("点击Cancel关闭注册视图")
		})
	}
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
