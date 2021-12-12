//
//  WW_OrderSingleVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/12/11.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class WW_OrderSingleVC: WW_MainBaseVC {

    var index : NSInteger = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configUI()
    }

    func configUI(){
        view.addSubview(self.tableView)

        self.tableView.snp.makeConstraints { make in
            make.left.top.right.equalTo(view)
            make.height.equalTo(300)
        }
    }
    
    func reloadByIndex(indexPage :NSInteger){
        print(indexPage)
        index = indexPage
        self.tableView.reloadData()
    }
    
    lazy var tableView : UITableView = {
        let tableView = UITableView.init(frame: CGRect.zero, style: .plain)
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier:"myCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        return tableView
    }()
}

extension WW_OrderSingleVC : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(index == 0){
            return 10
        }else if (index == 1){
            return 5
        }else if (index == 2){
            return 3
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = String(index)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
