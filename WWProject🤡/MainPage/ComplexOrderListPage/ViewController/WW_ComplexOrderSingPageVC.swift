//
//  WW_ComplexOrderSingPageVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/3/31.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_ComplexOrderSingPageVC: WW_MainBaseVC {
   
    let viewModel = WW_ComplexOrderListViewModel()

    var currenPage : NSInteger = 1
    
    override func viewDidLoad() {
        
        requestData(page: currenPage)
        configUI()
    }
    func configUI(){
        view.addSubview(self.tableView)
       
        self.tableView.snp.makeConstraints { make in
            make.left.top.right.equalTo(view)
            make.height.equalTo(UIScreen.main.bounds.size.height - 130)
        }
    }
    func requestData(page:Int){
        self.viewModel.reloadOrderListCurrentPage(page: 1, status: "ALL") {
            self.tableView.mj_header?.endRefreshing()
            if self.viewModel.productsArray.count < 12{
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
            self.requestData(page: 1)
        }
        let footer = WW_RefreshAutoGifFooter()
        tableView.mj_footer = footer
        tableView.mj_footer?.refreshingBlock = {
            print("上拉刷新")
            self.currenPage += 1
            self.requestData(page: self.currenPage)
        }
        return tableView
    }()
    
}
extension WW_ComplexOrderSingPageVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.productsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! WW_OrderListCell
//        let model = self.viewModel.productsArray[indexPath.row]
//        let price = model.reportPrice
//        let str = NSMutableAttributedString.init(string: "举报价格:")
//        let pri = "￥\(price ?? "")"
//        let attStr = NSAttributedString.init(string: pri, attributes: [NSAttributedString.Key.foregroundColor : UIColor(r: 241, g: 37, b: 37)])
//        str.append(attStr)
//        cell.reportPriceLabel.attributedText = str
//        cell.listImageView.kf.setImage(with: URL.init(string: self.viewModel.productsArray[indexPath.row].listImages ?? ""))
//        cell.listImageView.kf.indicatorType = .activity
//        cell.replyStateLabel.text = (self.viewModel.productsArray[indexPath.row].status == "1") ? "已回复" : "未回复"
//        cell.productTitleLabel.text = model.commodityName
//        cell.productSpecLabel.text = "规格:\(model.productName ?? "")"
//        cell.productPriceLabel.text = "零售价: ￥\(model.retailPrice ?? "")/\(model.unit ?? "")"
//        cell.timeLineLabel.text = model.createdTime
//        cell.replyContextLabel.text = model.reportResult
//        if (model.status == "1"){
//            cell.replyTitleLabel.isHidden = false
//            cell.replyContextLabel.isHidden = false
//        }else{
//            cell.replyTitleLabel.isHidden = true
//            cell.replyContextLabel.isHidden = true
//        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 220
    }
}
