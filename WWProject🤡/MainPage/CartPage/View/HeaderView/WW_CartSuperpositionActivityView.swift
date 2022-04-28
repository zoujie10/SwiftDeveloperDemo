//
//  WW_CartSuperpositionActivityView.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/4/27.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_CartSuperpositionActivityView: UITableViewHeaderFooterView,UITableViewDelegate,UITableViewDataSource {
   
    var sourceData = [WW_CartActivityModel]()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor(r: 246, g: 246, b: 246)
        creatUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func creatUI() {
        contentView.addSubview(headTableView)
        headTableView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
    func configData(data:WW_ActivityModel){
        self.sourceData = data.actList
        self.headTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sourceData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = self.sourceData[indexPath.row]
        
        if model.way == 1{
            let cell : WW_CartSuperpositionRandomActivityHeaderCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(WW_CartSuperpositionRandomActivityHeaderCell.classForCoder()), for: indexPath) as! WW_CartSuperpositionRandomActivityHeaderCell
            cell.selectionStyle = .none
            cell.configeCellData(data: model)
            return cell
        }else{//way == 2
            let cell : WW_CartSuperpositionSelectActivityHeaderCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(WW_CartSuperpositionSelectActivityHeaderCell.classForCoder()), for: indexPath) as! WW_CartSuperpositionSelectActivityHeaderCell
            cell.selectionStyle = .none
            cell.configeCellData(data: model)
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    lazy var headTableView : UITableView = {
        let tableView = UITableView.init(frame: CGRect.zero, style: .plain)
        tableView.register(WW_CartSuperpositionRandomActivityHeaderCell.classForCoder(), forCellReuseIdentifier:NSStringFromClass(WW_CartSuperpositionRandomActivityHeaderCell.classForCoder()))
        tableView.register(WW_CartSuperpositionSelectActivityHeaderCell.classForCoder(), forCellReuseIdentifier:NSStringFromClass(WW_CartSuperpositionSelectActivityHeaderCell.classForCoder()))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.init(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
        tableView.layer.cornerRadius = 4
        return tableView
    }()
}
