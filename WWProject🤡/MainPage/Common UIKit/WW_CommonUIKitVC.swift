//
//  WW_CommonUIKitVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/8/2.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_CommonUIKitVC: WW_MainBaseVC {
	var selectIdx = 0
    override func viewDidLoad() {
        super.viewDidLoad()
		self.title = "常用控件"
		view.backgroundColor = .white
        // Do any additional setup after loading the view.
		
		configBtn()
    }
	
	func configBtn(){
		view.addSubview(self.alertjumpBtn)
		self.alertjumpBtn.snp.makeConstraints { make in
			make.center.equalTo(self.view)
			make.size.equalTo(CGSize(width: WWScreenWidth, height: 30))
		}
		
		view.addSubview(self.tipjumpBtn)
		self.tipjumpBtn.snp.makeConstraints { make in
			make.top.equalTo(self.alertjumpBtn.snp_bottom).offset(20)
			make.size.equalTo(CGSize(width: WWScreenWidth, height: 30))
		}
		
		
	}
	@objc func click_method(){

		let alert = WW_AlertSelectTipView.init()
		alert.defaultSelectIndex = selectIdx
		alert.showWithData(listData: ["1","2","3","4","5"], title: "选择弹框")
		alert.select_tips_block = { [self] str , idx in
			selectIdx = idx
			print(str,idx)
		}
	}
	@objc func click_warning_method(){
		let vc = WW_PromptAlertVC.init()
		let str = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""
		vc.configContent(title: "提示", content: str,confirmTitle: "确认",cancelTitle: "取消",height: 240)
		
	}
	lazy var alertjumpBtn : UIButton = {
		let btn = UIButton()
		btn.setTitle("Alert View", for: .normal)
		btn.setTitleColor(.black, for: .normal)
		btn.addTarget(self, action: #selector(click_method), for: .touchUpInside)
		return btn
	}()
	lazy var tipjumpBtn : UIButton = {
		let btn = UIButton()
		btn.setTitle("Warning Tip", for: .normal)
		btn.setTitleColor(.black, for: .normal)
		btn.addTarget(self, action: #selector(click_warning_method), for: .touchUpInside)
		return btn
	}()
}
