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
    typealias clickindexPathBlock = (IndexPath) -> Void
    var clickBlock : clickindexPathBlock?
    
    var sourceArray = Array<Array<ZJ_ProductsModel>>()
    let viewMdeol  = ZJ_ProductsViewModel()
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.section == 1 && indexPath.row == 1){
            //单元格的插入
            self.sourceArray = self.viewMdeol.insertProductToList(index: indexPath.row)
//            tableView.insertRows(at: [indexPath], with: .automatic)//1 section时用 不用手动reloadData
            self.tableView.reloadData()
        }else if indexPath.section == 0 && indexPath.row == 2 {//删除
            self.sourceArray = self.viewMdeol.deleteProductToList(index: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .automatic)//1 section时用 不用手动reloadData
            self.tableView.reloadData()
        }else if indexPath.section == 2 && indexPath.row == 1{
            
            self.clickBlock!(indexPath)
        }
        else{
            
        }
    }
    
    //索引目录
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        var array = [String]()
        for item in self.sourceArray{
            for items in item{
                array.append(items.ProductName ?? "无")
            }
        }
        return array
    }
    
    //点击索引
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        print("click index--\(index)")
        return index
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let array = self.sourceArray[section]
        let title = array.first?.ProductName
        return title
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sourceArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sourceArray[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell : ZJ_ProductsTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellID)! as! ZJ_ProductsTableViewCell
        let array = self.sourceArray[indexPath.section]
      
        cell.titleLabel.text = array[indexPath.row].ProductName as String?
        let str = array[indexPath.row].ProductIcon as String?
        cell.iconImageView.image = UIImage.init(named: str!)
        let doubelStr : Double = array[indexPath.row].productPrice! as Double
        cell.priceLable.text = "\(doubelStr)"
        cell.desLabel.text = array[indexPath.row].keyInfo
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
        self.sourceArray = self.viewMdeol.rightListProducts()
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
