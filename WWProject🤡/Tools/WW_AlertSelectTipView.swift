//
//  WW_AlertSelectTipView.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/7/30.
//  Copyright © 2022 Zoujie. All rights reserved.
//

//TODO
//1.single select / mutli select
//2.On Window
//3.display animation
//4.Cancel button  bottom or upRight

import UIKit

class WW_AlertSelectTipCell:UITableViewCell{
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: .default, reuseIdentifier: reuseIdentifier)
		configUI()
	}

	func configUI(){
		
		self.contentView.addSubview(self.tipsLabel)
		self.tipsLabel.snp.makeConstraints { make in
			make.edges.equalTo(self.contentView)
		}
		
		self.contentView.addSubview(self.lineView)
		self.lineView.snp.makeConstraints { make in
			make.left.bottom.right.equalTo(self.contentView)
			make.height.equalTo(0.5)
		}
	}
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	lazy var tipsLabel : UILabel = {
		let label = UILabel()
		label.textAlignment = .center
		label.backgroundColor = .white
		label.textColor = .black
		label.text = ""
		label.font = .boldSystemFont(ofSize: 20)
		return label;
	}()
	
	lazy var lineView : UIView = {
		let view = UIView.init()
		view.backgroundColor = .white
		return view
	}()
}

class WW_AlertSelectTipView: UIViewController {
	
	var defaultSelectIndex = 0
	
	typealias Select_indexTips_Block = (_ content:String,_ idx : NSInteger) -> Void
	var select_tips_block : Select_indexTips_Block?

	var tipsArray = [String]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = UIColor(r: 0, g: 0, b: 0, a: 0.6)
	}
	func showWithData(listData : [String],title:String){
		WW_keyWindow?.rootViewController?.addChildViewController(self)
		WW_keyWindow?.addSubview(self.view)
		self.titleLabel.text = title
		self.tipsArray = listData
		addContenView()
		self.tipsTableView.reloadData()
	}
	func addContenView(){
		self.view.addSubview(self.bgView)
		self.bgView.addSubview(self.titleLabel)
		self.bgView.addSubview(self.tipsTableView)
		
		//动画用frame 来做  snp布局无法实现动画
		self.bgView.frame = CGRect(x: 0, y: Int(WWScreenHeight), width: Int(WWScreenWidth), height: (self.tipsArray.count * 45 + 45 + WW_Device_TabBar_Height))
		let bgView_y =  CGFloat(WWScreenHeight-CGFloat((self.tipsArray.count * 45 + 45 + WW_Device_TabBar_Height)))
		let bgView_height = self.tipsArray.count * 45 + 45 + WW_Device_TabBar_Height
		UIView.animate(withDuration: 0.2) {
			self.bgView.frame = CGRect(x: 0, y:Int(bgView_y), width: Int(WWScreenWidth), height:bgView_height)
		} completion: { t in}

		self.titleLabel.snp.makeConstraints { make in
			make.left.top.right.equalTo(bgView)
			make.height.equalTo(45)
		}
		self.tipsTableView.snp.makeConstraints { make in
			make.left.right.equalTo(bgView)
			make.top.equalTo(self.titleLabel.snp_bottom)
			make.height.equalTo(self.tipsArray.count * 45)
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
		label.font = .boldSystemFont(ofSize: 16)
		return label;
	}()

	lazy var tipsTableView : UITableView = {
		let tableView = UITableView.init(frame: CGRect.zero)
		tableView.register(WW_AlertSelectTipCell.classForCoder(), forCellReuseIdentifier:"tipsCell")
		tableView.delegate = self
		tableView.dataSource = self
		tableView.showsVerticalScrollIndicator = false
		tableView.separatorStyle = .none
		tableView.backgroundColor = UIColor.init(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
		
		return tableView
	}()
	
}
extension WW_AlertSelectTipView:UITableViewDelegate,UITableViewDataSource{
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return tipsArray.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell : WW_AlertSelectTipCell = tableView.dequeueReusableCell(withIdentifier: "tipsCell") as! WW_AlertSelectTipCell
		
		cell.tipsLabel.text = self.tipsArray[indexPath.row]
		if(self.defaultSelectIndex == indexPath.row){
			cell.tipsLabel.textColor = .red
		}else{
			cell.tipsLabel.textColor = .black
		}
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.defaultSelectIndex = indexPath.row
		self.select_tips_block!(self.tipsArray[indexPath.row],indexPath.row)
		removeVC()
	}
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 45
	}
	func removeVC(){
		UIView.animate(withDuration: 0.2) {
			self.bgView.frame.origin.y = WWScreenHeight
		} completion: { done in
			self.removeFromParentViewController()
			self.view.removeFromSuperview()
		}
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		let touch = touches.first!
		let point = touch.location(in: view)
		let layer = self.view.layer.hitTest(point)
		if layer == self.view.layer{
			removeVC()
		}
	}
}
