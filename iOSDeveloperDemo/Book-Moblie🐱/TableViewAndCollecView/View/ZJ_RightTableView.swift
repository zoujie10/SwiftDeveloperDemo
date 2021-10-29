//
//  ZJ_RightTableViewCell.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/10/29.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class ZJ_RightTableView: UIView,UITableViewDelegate,UITableViewDataSource {

    let cellID = "cellId"
    var sourceArray = Array<ZJ_ProductsModel>()
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.sourceArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : ZJ_ProductsTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellID)! as! ZJ_ProductsTableViewCell
        cell.titleLabel.text = self.sourceArray[indexPath.row].ProductName as String?
        let str = self.sourceArray[indexPath.row].ProductIcon as String?
        cell.iconImageView.image = UIImage.init(named: str!)
        let doubelStr : Double = self.sourceArray[indexPath.row].productPrice! as Double
        cell.priceLable.text = "\(doubelStr)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
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
    
    func update(array : [ZJ_ProductsModel]){
        self.sourceArray = array
        self.tableView.reloadData()
    }
    lazy var tableView : UITableView = {
        let tableView = UITableView.init(frame: CGRect.zero, style: .plain)
        tableView.register(ZJ_ProductsTableViewCell.classForCoder(), forCellReuseIdentifier:self.cellID)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .singleLine
        return tableView
    }()
   
}
