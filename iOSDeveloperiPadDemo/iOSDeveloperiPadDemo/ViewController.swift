//
//  ViewController.swift
//  iOSDeveloperiPadDemo
//
//  Created by Zoujie on 2018/6/5.
//  Copyright © 2018年 Zoujie. All rights reserved.
//

import UIKit
import ToolModelFrameWorkSDK

class ViewController: UIViewController,UIPopoverPresentationControllerDelegate {
	var popVC : UIViewController = UIViewController()
	
	@IBAction func rightAction(_ sender: UIBarButtonItem) {
		popVC.view.backgroundColor = UIColor.orange
		popVC.preferredContentSize = CGSize(width: 150, height: 150)
		popVC.modalPresentationStyle = UIModalPresentationStyle.popover
		popVC.isModalInPopover = false
		
		let BtnOne : UIButton = UIButton()
		BtnOne.frame = CGRect(x: 0, y: 0, width: popVC.view.frame.width, height: 30)
		BtnOne.backgroundColor = UIColor.blue
		BtnOne.addTarget(self, action:#selector(tapOneBtn), for: UIControlEvents.touchUpInside)
		BtnOne.setTitle("选项一", for: UIControlState.normal)
		popVC.view.addSubview(BtnOne)
		
		let BtnTwo : UIButton = UIButton()
		BtnTwo.frame = CGRect(x: 0, y: 30, width: popVC.view.frame.width, height: 30)
		BtnTwo.backgroundColor = UIColor.green
		BtnTwo.addTarget(self, action:#selector(tapOneTwo), for: UIControlEvents.touchUpInside)
		BtnTwo.setTitle("选项二", for: UIControlState.normal)
		popVC.view.addSubview(BtnTwo)
		
		let popoverPresentationController = popVC.popoverPresentationController
		popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem
		popoverPresentationController?.delegate = self
		popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.any
		self.present(popVC, animated: true) {
			
		}
	}
//	@IBAction func leftAction(_ sender: UIBarButtonItem) {
//		
//	}
	
	@objc func tapOneBtn()  {
		print("TapOne")
		self.dismiss(animated: true) {
		
		}
	}
	
	@objc func tapOneTwo(){
		print("TapTwo")
		
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
		return .none
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

