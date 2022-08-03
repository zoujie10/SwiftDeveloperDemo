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

}

class WW_AlertSelectTipView: UIView {
	
	var defaultSelectIndex = 0
	
	typealias Select_indexTips_Block = (_ content:String,_ idx : NSInteger) -> Void
	var select_tips_block : Select_indexTips_Block?

	var tipsArray = [String]()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
	}
	
	convenience init(listData:[String],title:String) {
		self.init()
		self.layer.cornerRadius = 8
		self.layer.borderColor = UIColor(r: 150, g: 150, b: 150).cgColor
		self.layer.borderWidth = 1
		addContenView()
		self.titleLabel.text = title
		self.tipsArray = listData
		self.tipsTableView.reloadData()
	}
	 
	func addContenView(){
		self.addSubview(self.titleLabel)
		self.addSubview(self.tipsTableView)
		self.titleLabel.snp.makeConstraints { make in
			make.left.top.right.equalTo(self)
			make.height.equalTo(45)
		}
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
		self.removeFromSuperview()
	}
}
