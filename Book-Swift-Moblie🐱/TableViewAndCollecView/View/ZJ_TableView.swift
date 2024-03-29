//
//  ZJ_TableView.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/10/28.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class ZJ_TableView: UIView,UITableViewDelegate,UITableViewDataSource {
    let cellID = "cellId"
    var sourceArray = [categoryInfoItemModel]()
   
    typealias clickindexPathBlock = (IndexPath) -> Void
    var clickBlock : clickindexPathBlock?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.sourceArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellID)!
        let model : categoryInfoItemModel = self.sourceArray[indexPath.row]
        cell.textLabel?.text = model.displayName
        cell.backgroundColor = UIColor.init(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
        cell.selectedBackgroundView?.backgroundColor = UIColor.white
        if(model.isSelected!){
            cell.textLabel?.textColor = UIColor.init(red: 247/255, green: 54/255, blue: 81/255, alpha: 1)
            cell.backgroundColor = UIColor.white
        }else{
            cell.textLabel?.textColor = UIColor.init(red: 163/255, green: 163/255, blue: 163/255, alpha: 1)
            cell.backgroundColor = UIColor.init(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
        self.clickBlock!(indexPath)
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
    
    func update(array : [categoryInfoItemModel]){
        self.sourceArray = array
        self.tableView.reloadData()
    }
    
    lazy var tableView : UITableView = {
        let tableView = UITableView.init(frame: CGRect.zero, style: .plain)
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier:self.cellID)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.init(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
        
        return tableView
    }()
}
