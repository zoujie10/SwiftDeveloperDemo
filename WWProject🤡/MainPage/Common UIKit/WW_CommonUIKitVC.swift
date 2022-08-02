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
		view.backgroundColor = .white
        // Do any additional setup after loading the view.
		configBtn()
    }
	
	func configBtn(){
		view.addSubview(self.alertjumpBtn)
		self.alertjumpBtn.snp.makeConstraints { make in
			make.center.equalTo(self.view)
			make.size.equalTo(CGSize(width: 50, height: 30))
		}
	}
	@objc func click_method(){
		let alert = WW_AlertSelectTipView.init(listData: ["1","2","3"], title: "选择弹框")
		alert.defaultSelectIndex = selectIdx
		alert.select_tips_block = { [self] str , idx in
			selectIdx = idx
			print(str,idx)
			
		}
		self.view.addSubview(alert)
		alert.snp.makeConstraints { make in
			make.left.right.bottom.equalTo(self.view)
			make.height.equalTo(45 * 3 + 50)
		}
	}
	lazy var alertjumpBtn : UIButton = {
		let btn = UIButton()
		btn.setTitle("bounce frame ", for: .normal)
		btn.setTitleColor(.black, for: .normal)
		btn.addTarget(self, action: #selector(click_method), for: .touchUpInside)
		return btn
	}()
}
