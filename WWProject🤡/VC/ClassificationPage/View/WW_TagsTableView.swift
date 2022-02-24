//
//  WW_TagsTableView.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/12/7.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class WW_TagsTableView: UIView,UITableViewDelegate,UITableViewDataSource{

    let cellID = "cellId"
    var sourceArray = [WW_CategoryInfoItemModel]()
   
    typealias clickindexPathBlock = (IndexPath) -> Void
    var clickBlock : clickindexPathBlock?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.sourceArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : WW_LeftTagsTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellID) as! WW_LeftTagsTableViewCell
        let model : WW_CategoryInfoItemModel = self.sourceArray[indexPath.row]
        cell.titleLabel.text = model.displayName
      
        if(model.isSelected!){
            cell.titleLabel.textColor = UIColor.init(red: 252/255, green: 67/255, blue: 85/255, alpha: 1)//选中 color
            cell.backgroundColor = UIColor.white
            cell.verticalLine.isHidden = false
        }else{
            cell.titleLabel.textColor = UIColor.init(red: 163/255, green: 163/255, blue: 163/255, alpha: 1)//非选中 color
            cell.backgroundColor = UIColor.init(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
            cell.verticalLine.isHidden = true
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
        self.clickBlock!(indexPath)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
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
    
    func update(array : [WW_CategoryInfoItemModel]){
        self.sourceArray = array
        self.tableView.reloadData()
    }
    
    lazy var tableView : UITableView = {
        let tableView = UITableView.init(frame: CGRect.zero, style: .plain)
        tableView.register(WW_LeftTagsTableViewCell.classForCoder(), forCellReuseIdentifier:self.cellID)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.init(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
        
        return tableView
    }()

}
