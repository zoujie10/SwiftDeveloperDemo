//
//  WW_PromptAlertVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/8/3.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_PromptAlertVC: UIViewController {

	var defaultBgHeight = 150
	
    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = UIColor(r: 0, g: 0, b: 0, a: 0.6)
    }
	func makeDefaultUI(){
		self.view.addSubview(self.bgView)
		self.view.addSubview(self.titleLabel)
		self.view.addSubview(self.confirmBtn)
		self.view.addSubview(self.cancelBtn)
		self.view.addSubview(self.contentLabel)
	}
	
	func configContent(title:String,content:String,confirmTitle:String,cancelTitle:String,height:NSInteger){
		self.titleLabel.text = title
		makeDefaultUI()
		
		self.bgView.snp.makeConstraints { make in
			make.width.equalTo(WWScreenWidth*3/4)
			make.height.equalTo(height > 0 ? height : defaultBgHeight)
			make.center.equalTo(self.view)
		}
		
		self.titleLabel.snp.makeConstraints { make in
			make.top.equalTo(self.bgView).offset(10)
			make.centerX.equalTo(self.bgView)
		}
		
		self.confirmBtn.snp.makeConstraints { make in
			make.right.equalTo(self.bgView).offset(-15)
			make.bottom.equalTo(self.bgView).offset(-15)
		}
		
		self.cancelBtn.snp.makeConstraints { make in
			make.left.equalTo(self.bgView).offset(15)
			make.bottom.equalTo(self.bgView).offset(-15)
		}
		
		self.contentLabel.snp.makeConstraints { make in
			make.top.equalTo(self.titleLabel.snp_bottom).offset(10)
			make.centerX.equalTo(self.bgView)
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
		btn.setTitle("确认", for: .normal)
		btn.setTitleColor(.black, for: .normal)
		btn.addTarget(self, action: #selector(click_method_confirm), for: .touchUpInside)
		return btn
	}()
	
	lazy var cancelBtn : UIButton = {
		let btn = UIButton()
		btn.setTitle("取消", for: .normal)
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
