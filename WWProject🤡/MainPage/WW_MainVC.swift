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
    var vcArray = [String]()
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
        

    }
    override func viewWillAppear(_ animated: Bool) {
//        self.navigationController?.setNavigationBarHidden(true, animated: true)
        //隐藏返回按钮
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.hidesBackButton = true
    }
    func dataArrayMethod(){
        dataArray = ["分类页",
        "售后",
        "订单列表",
        "榜单",
        "搜索",
        "首页",
        "客户管理",
        "购物车"]
        //存跳转的控制器
        vcArray = [self.swiftStringFromClass(cls: WW_ClassificationListVC.self),
                   self.swiftStringFromClass(cls: WW_AfterDetailVC.self),
                   self.swiftStringFromClass(cls: WW_OrderListVC.self),
                   self.swiftStringFromClass(cls: WW_HeroListVC.self),
                   self.swiftStringFromClass(cls: WW_SearchHotWordsVC.self),
                   self.swiftStringFromClass(cls: WW_HomeListVC.self),
                   self.swiftStringFromClass(cls: WW_CustomerMainVC.self)
        ]
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
        let vc : AnyClass = self.classFromString(str: vcArray[indexPath.row])
        guard let jumpVC = vc as? UIViewController.Type else{
            return
        }
        self.navigationController?.pushViewController(jumpVC.init(), animated: true)
    }
 
    func swiftStringFromClass(cls : AnyClass) -> String{
        let str : String = NSStringFromClass(cls)
        return str
    }
    
    func classFromString(str : String) -> AnyClass{
        let cls: AnyClass? = NSClassFromString(str)
        return cls!
    }
}
