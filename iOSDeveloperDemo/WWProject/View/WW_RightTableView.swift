//
//  WW_RightTableView.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/12/7.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit
import Kingfisher

class WW_RightTableView: UIView,UITableViewDelegate,UITableViewDataSource  {

    let cellID = "cellId"
    
    typealias clickPushindexPathBlock = (IndexPath) -> Void
    var clickPushBlock : clickPushindexPathBlock?
    
    var sourceArray = Array<WW_ProductListInfoModel>()
  
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sourceArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell : WW_ProductsTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellID)! as! WW_ProductsTableViewCell
        let model : WW_ProductListInfoModel = self.sourceArray[indexPath.row]
      
        cell.titleLabel.text = model.template.name
        let str = model.template.listImages ?? " "
        cell.iconImageView.kf.setImage(with: URL.init(string: str))
        cell.iconImageView.kf.indicatorType = .activity
//        cell.priceLable.text = String(format: "￥%.2f", model.template.origPrice!)
        let priText = "￥\(model.template.origPrice ?? "")"
        cell.priceLable.text = priText.appendString(value: "/\(model.template.unit ?? "")")
        cell.desLabel.text = model.template.displayName
        cell.clickBlock = {
            //TODO add to cart
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let array = self.viewMdeol.sourceArray[indexPath.section]
//        let model = array[indexPath.row]
//        let att = NSAttributedString.init(string: model.ProductName!)
//        att.boundingRect(with: CGSize.init(width: <#T##CGFloat#>, height: <#T##CGFloat#>), options: <#T##NSStringDrawingOptions#>, context: nil)
        //文本高度 设置cell
        return 110
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.clickPushBlock!(indexPath)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        creatUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func creatUI(){
        self.addSubview(self.tableView)
        self.tableView.snp.makeConstraints {
            $0.edges.equalTo(self)
        }
    }
    func update(array : [WW_ProductListInfoModel]){
        self.sourceArray = array
        self.tableView.reloadData()
    }
    lazy var tableView : UITableView = {
        let tableView = UITableView.init(frame: CGRect.zero, style: .plain)
        tableView.register(WW_ProductsTableViewCell.classForCoder(), forCellReuseIdentifier:self.cellID)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .singleLine
        return tableView
    }()
   
}
