//
//  AlertAndActionViewController.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2018/5/9.
//  Copyright © 2018年 Zoujie. All rights reserved.
//

import UIKit

class AlertAndActionViewController: UIViewController {
	@IBOutlet var displayLB: UILabel!
	@IBOutlet var WarinningLB: UINavigationItem!
	
	@IBAction func addBtn(_ sender: UIBarButtonItem) {
//		WarinningLB.title = "add"
		self.dismiss(animated: true) {
			
		}
	}
	@IBAction func saveBtn(_ sender: UIBarButtonItem) {
		WarinningLB.title = "Save"
	}

	@IBAction func TapOne(_ sender: UIBarButtonItem) {
		displayLB.text = "One"
		displayLB.backgroundColor = UIColor.blue
	}
	
	@IBAction func TapTwo(_ sender: UIBarButtonItem) {
		displayLB.text = "Two"
		displayLB.backgroundColor = UIColor.red
	}
	
	@IBAction func TapThree(_ sender: UIBarButtonItem) {
		displayLB.text = "Three"
		displayLB.backgroundColor = UIColor.orange
	}
	@IBAction func AlertBtn(_ sender: UIButton) {
		
//		var alert = UIAlertView  弃用
		let alert : UIAlertController = UIAlertController (title: "Warnning", message: "Plaese Don't Do this!!!", preferredStyle: UIAlertControllerStyle.alert)
		alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: { (alertAction) in
			print("Tap Cancel")
		}))
		alert.addAction(UIAlertAction(title: "Confirm", style: UIAlertActionStyle.default, handler: { (alertAction) in
			print("Tap Confirm")
		}))
		alert.addAction(UIAlertAction(title: "Others", style: UIAlertActionStyle.destructive, handler: { (alertAction) in
			print("Tap Others")//destructive  红色标题
		}))
		self.present(alert, animated: true) {
			
		}
	}
	
	@IBAction func ActionBtn(_ sender: UIButton) {
//		let action : UIActionSheet 弃用
		let action : UIAlertController = UIAlertController()
		
		action.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: { (alertAction) in
			print("Tap Cancel")//cencel 只能添加一个
		}))
		action.addAction(UIAlertAction(title: "Selected", style: UIAlertActionStyle.default, handler: { (alertAction) in
			print("Tap Selected")
		}))
		action.addAction(UIAlertAction(title: "Confirm", style: UIAlertActionStyle.default, handler: { (alertAction) in
			print("Tap Confirm")
		}))
		action.addAction(UIAlertAction(title: "Others", style: UIAlertActionStyle.destructive, handler: { (alertAction) in
			print("Tap Others")//destructive  红色标题
		}))
		self.present(action, animated: true) {
			
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
    
}
