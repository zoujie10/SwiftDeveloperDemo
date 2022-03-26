//
//  WW_SingleOrderBaseVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/12/21.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class WW_SingleOrderBaseVC: WW_MainBaseVC {

    var viewModel = WW_InformListViewModel()
    let statusArray = ["ALL","UN_REPLY","REPLY"]
    var index : NSInteger = 0
    var currenPage : NSInteger = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        reloadByIndex(indexPage: 0 ,currentPage: 1)
        configUI()
        // Do any additional setup after loading the view.
    }
    func configUI(){
        view.addSubview(self.tableView)
       
        self.tableView.snp.makeConstraints { make in
            make.left.top.right.equalTo(view)
            make.height.equalTo(UIScreen.main.bounds.size.height - 130)
        }
    }
    

    func reloadByIndex(indexPage :NSInteger,currentPage:NSInteger){

        self.viewModel.getInformOrderList(status: self.statusArray[indexPage], currentPage: currenPage, pageSize: 10) {
            self.tableView.mj_header?.endRefreshing()
            if (self.viewModel.productsArray.count < 10 || self.viewModel.dataModel.total == self.viewModel.productsArray.count){
                self.tableView.mj_footer?.endRefreshingWithNoMoreData()
            }else{
                self.tableView.mj_footer?.endRefreshing()
            }
            self.tableView.reloadData()
        } failureBlock: { msg in
            print("网络请求失败",msg)
        }
    }
    
    lazy var tableView : UITableView = {
        let tableView = UITableView.init(frame: CGRect.zero, style: .plain)
        tableView.register(WW_OrderListCell.classForCoder(), forCellReuseIdentifier:"myCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        let header = WW_RefreshStateHeader()
        tableView.mj_header = header
        tableView.mj_header?.refreshingBlock = {[self] in
            print("下拉刷新")
            self.reloadByIndex(indexPage: self.index,currentPage: 1)
        }
        let footer = WW_RefreshAutoGifFooter()
        tableView.mj_footer = footer
        tableView.mj_footer?.refreshingBlock = {
            print("上拉刷新")
            self.currenPage += 1
            self.reloadByIndex(indexPage: self.index , currentPage: self.currenPage)
        }
        return tableView
    }()
    
}

extension WW_SingleOrderBaseVC : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.productsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! WW_OrderListCell
        let model = self.viewModel.productsArray[indexPath.row]
        let price = model.reportPrice
        let str = NSMutableAttributedString.init(string: "举报价格:")
        let pri = "￥\(price ?? "")"
        let attStr = NSAttributedString.init(string: pri, attributes: [NSAttributedString.Key.foregroundColor : UIColor(r: 241, g: 37, b: 37)])
        str.append(attStr)
        cell.reportPriceLabel.attributedText = str
        cell.listImageView.kf.setImage(with: URL.init(string: self.viewModel.productsArray[indexPath.row].listImages ?? ""))
        cell.listImageView.kf.indicatorType = .activity
        cell.replyStateLabel.text = (self.viewModel.productsArray[indexPath.row].status == "1") ? "已回复" : "未回复"
        cell.productTitleLabel.text = model.commodityName
        cell.productSpecLabel.text = "规格:\(model.productName ?? "")"
        cell.productPriceLabel.text = "零售价: ￥\(model.retailPrice ?? "")/\(model.unit ?? "")"
        cell.timeLineLabel.text = model.createdTime
        cell.replyContextLabel.text = model.reportResult
        if (model.status == "1"){
            cell.replyTitleLabel.isHidden = false
            cell.replyContextLabel.isHidden = false
        }else{
            cell.replyTitleLabel.isHidden = true
            cell.replyContextLabel.isHidden = true
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let model = self.viewModel.productsArray[indexPath.row]
        if model.status == "1"{
            let tw = UITextView().then { $0.font = UIFont.systemFont(ofSize: 13) }
            tw.text = model.reportResult
            let height = tw.sizeThatFits(CGSize(width: WWScreenWidth - 70, height: CGFloat.infinity)).height
            return 200 + height
        }else{
            return 200
        }
    }
}
