//
//  WW_PromptAlertVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/8/3.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_PromptAlertVC: UIViewController {

	var bgViewHeight = 150
	
    override func viewDidLoad() {
        super.viewDidLoad()
    }
	func makeDefaultUI(){
		self.view.addSubview(self.bgView)
		self.view.addSubview(self.titleLabel)
		self.view.addSubview(self.confirmBtn)
		self.view.addSubview(self.cancelBtn)
		self.view.addSubview(self.contentLabel)
	}
	func configContent(title:String,height:NSInteger){
		self.titleLabel.text = title
		makeDefaultUI()
		
		self.bgView.snp.makeConstraints { make in
			make.width.equalTo(WWScreenWidth*2/3)
			make.height.equalTo(height)
			make.center.equalTo(self.view)
		}
		
		self.titleLabel.snp.makeConstraints { make in
			make.top.equalTo(view).offset(10)
			make.centerX.equalTo(view)
		}
		self.confirmBtn.snp.makeConstraints { make in
			make.right.equalTo(view).offset(-15)
			make.bottom.equalTo(view).offset(-15)
		}
		
		self.cancelBtn.snp.makeConstraints { make in
			make.left.equalTo(view).offset(-15)
			make.bottom.equalTo(view).offset(-15)
		}
		
		self.contentLabel.snp.makeConstraints { make in
			make.top.equalTo(self.titleLabel.snp_bottom).offset(10)
			make.centerX.equalTo(view)
		}
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
	
	lazy var contentLabel : UILabel = {
		let label = UILabel()
		label.textAlignment = .center
		label.backgroundColor = .white
		label.textColor = .black
		label.text = ""
		label.font = .boldSystemFont(ofSize: 20)
		label.numberOfLines = 0
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
		UIView.animate(withDuration: 0.5) {
			self.bgView.alpha = 0
			self.bgView.transform = CGAffineTransform(scaleX: 0.1,y: 0.1)//CGAffineTransformMakeScale(0.1, 0.1)
		} completion: { done in
			self.dismiss(animated: true)
		}

	}
	
	@objc func click_method_cancel(){
		
	}
}
