//
//  WW_MainVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/12/6.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class WW_MainVC: WW_MainBaseVC,UITableViewDelegate,UITableViewDataSource {
    var dataArray = [String]()
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "WW"
        dataArrayMethod()
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        //隐藏返回按钮
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.hidesBackButton = true
    }
    func dataArrayMethod(){
        dataArray = ["分类页",
        "售后",
        "订单列表"]
    }
    //MARK: UITableview data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = self.dataArray[indexPath.row]
        return cell
    }
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            self.navigationController?.pushViewController(WW_ClassificationListVC(), animated: true)
        }else if indexPath.row == 1{
            self.navigationController?.pushViewController(WW_AfterDetailVC(), animated: true)
        }else if indexPath.row == 2{
            self.navigationController?.pushViewController(WW_OrderListVC(), animated: true)
        }
    }

}
