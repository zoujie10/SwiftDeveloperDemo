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
		self.contentView.addSubview(self.tipsBtn)
		self.tipsBtn.snp.makeConstraints { make in
			make.edges.equalTo(self.contentView)
		}
	}
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	@objc func click_method(sender:UIButton){
		tipsBtn.select(sender)
		
	}
	lazy var Label : UILabel = {
		let label = UILabel()
		label.textAlignment = .center
		label.backgroundColor = .white
		label.textColor = .black
		label.text = ""
		label.font = .boldSystemFont(ofSize: 20)
		return label;
	}()
	
	lazy var tipsBtn : UIButton = {
		let btn = UIButton()
		btn.setTitle("", for: .normal)
		btn.setTitleColor(.black, for: .normal)
		btn.setTitleColor(.blue, for: .selected)
		btn.setBackgroundImage(UIImage(named: "ww_shoping_carts_select_btn_img_dark"), for: .normal)
		btn.setBackgroundImage(UIImage(named: "ww_shoping_carts_unselect_btn_img_dark"), for: .selected)
		btn.addTarget(self, action: #selector(click_method), for: .touchUpInside)
		
		return btn
	}()
}

class WW_AlertSelectTipView: UIView {

	var tipsArray = [String]()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	convenience init(listData:NSArray,title:String) {
		self.init()
		addContenView()
		self.titleLabel.text = title
	}
	 
	func addContenView(){
		self.addSubview(self.tipsTableView)
		self.tipsTableView.snp.makeConstraints { make in
			make.edges.equalTo(UIEdgeInsetsMake(45, 0, 0, 0))
		}
	}
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	lazy var titleLabel : UILabel = {
		let label = UILabel()
		label.textAlignment = .center
		label.backgroundColor = .white
		label.textColor = .black
		label.text = ""
		label.font = .boldSystemFont(ofSize: 20)
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
//		cell.tipsBtn.isSelected =
		return cell
	}
	
	
}
