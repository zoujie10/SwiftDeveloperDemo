//
//  WW_OrderSingleVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/12/11.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class WW_OrderSingleVC: WW_MainBaseVC {

    var viewModel = WW_InformListViewModel()
    let statusArray = ["ALL","UN_REPLY","REPLY"]
    var index : NSInteger = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        reloadByIndex(indexPage: 0)
        configUI()
    }

    func configUI(){
        view.addSubview(self.tableView)
       
        self.tableView.snp.makeConstraints { make in
            make.left.top.right.equalTo(view)
            make.height.equalTo(UIScreen.main.bounds.size.height - 130)
        }
    }
    
    func reloadByIndex(indexPage :NSInteger){
        print(indexPage)
        index = indexPage
        self.viewModel.getInformOrderList(status: self.statusArray[index], currentPage: 1, pageSize: 10)
        self.viewModel.dataInformListComplete = { [self] in
            self.tableView.reloadData()
        }
    }
    
    
    
    lazy var tableView : UITableView = {
        let tableView = UITableView.init(frame: CGRect.zero, style: .plain)
        tableView.register(WW_OrderListCell.classForCoder(), forCellReuseIdentifier:"myCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        return tableView
    }()
}

extension WW_OrderSingleVC : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.productsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! WW_OrderListCell
        let price = self.viewModel.productsArray[indexPath.row].reportPrice
        cell.reportPriceLabel.text = "￥\(price ?? "")" 
        cell.listImageView.kf.setImage(with: URL.init(string: self.viewModel.productsArray[indexPath.row].listImages ?? ""))
        cell.replyStateLabel.text = (self.viewModel.productsArray[indexPath.row].status == "1") ? "已回复" : "未回复"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 2{
            let tw = UITextView().then { $0.font = UIFont.systemFont(ofSize: 13) }
            tw.text = "已回复已回复已回复已回复已回复已回复已回复已回复已回复已回复已回复已回复已回复已回复已回复已回复已回复已回复已回复已回复已回复已回复已回复已回复已回复已回复已回复已回复已回复已回复已回复已回复已回复已回复已回复已回复"
            let height = tw.sizeThatFits(CGSize(width: WWScreenWidth - 70, height: CGFloat.infinity)).height
            return 250 + height
        }else{
            return 250
        }
    }
}
