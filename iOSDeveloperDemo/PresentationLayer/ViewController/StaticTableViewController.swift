//
//  StaticTableViewController.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2018/5/22.
//  Copyright © 2018年 Zoujie. All rights reserved.
//

import UIKit
//静态表中可以不实现数据源和委托协议的方法
class StaticTableViewController: UITableViewController {

	@IBOutlet var nameField: UITextField!
	
	@IBOutlet var passField: UITextField!
	
	@IBAction func loginBtn(_ sender: UIButton) {
		if self.nameField.text == "jie" && (self.passField.text == "111111"){
			print("Login succeed")
		}else{
			print("Input wrong")
		}
	}
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print("Creat New Account")
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
