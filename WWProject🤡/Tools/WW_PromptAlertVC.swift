//
//  WW_PromptAlertVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/8/3.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_PromptAlertVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        makeDefaultUI()
    }
	func makeDefaultUI(){
		
	}
	func configContent(title:String){
		self.titleLabel.text = title
	}
	
	
	
	lazy var bgView : UIView = {
		let view = UIView.init()
		view.backgroundColor = .white
		return view
	}()
	
	lazy var titleLabel : UILabel = {
		let label = UILabel()
		label.textAlignment = .center
		label.backgroundColor = .white
		label.textColor = .black
		label.text = ""
		label.font = .boldSystemFont(ofSize: 20)
		return label;
	}()
	
	lazy var confirmBtn : UIButton = {
		let btn = UIButton()
		btn.setTitle("", for: .normal)
		btn.setTitleColor(.black, for: .normal)
		btn.addTarget(self, action: #selector(click_method_confirm), for: .touchUpInside)
		return btn
	}()
	
	lazy var cancelBtn : UIButton = {
		let btn = UIButton()
		btn.setTitle("", for: .normal)
		btn.setTitleColor(.black, for: .normal)
		btn.addTarget(self, action: #selector(click_method_cancel), for: .touchUpInside)
		return btn
	}()

}
extension WW_PromptAlertVC{
	@objc func click_method_confirm(){
		
	}
	
	@objc func click_method_cancel(){
		
	}
}
