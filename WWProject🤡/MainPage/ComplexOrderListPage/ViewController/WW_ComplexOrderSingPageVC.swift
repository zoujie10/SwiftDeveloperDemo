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
    var countTimeArray = NSMutableArray()
    var countDownTimeDict = NSMutableDictionary()
    
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
            self.cleanTimeAbout()
            self.enumerateDatasourceCountDown()
            self.tableView.reloadData()
        } failureBlock: { msg in
            print("网络请求失败",msg)
        }
    }
    
    func enumerateDatasourceCountDown(){
        for i in 0 ..< self.viewModel.productsArray.count{
            let model = self.viewModel.productsArray[i]
            if model.isTimers == true {
                countDownModel(model: model, index: i)
            }
        }
    }
    
    func countDownModel(model : WW_ComplexOrderSingleOrderData,index:NSInteger){
        let indexKey = "\(index)"
        let dict = NSMutableDictionary.init()
        dict.setObject(indexKey, forKey: "indexPath" as NSCopying)//定时器 info
        let strTime = model.time
        dict.setObject(strTime as Any, forKey: indexKey as NSCopying)
        let numberInteger = self.countDownTimeDict[indexKey] ?? 0//未添加前 是空值
        if (numberInteger as! Int) <= 0 { //添加定时器
            
            let timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.numberTime), userInfo: dict, repeats: true)
            self.countTimeArray.add(timer)
            print("indexKey----------",indexKey,self.countDownTimeDict,self.countTimeArray)
            RunLoop.current.add(timer, forMode: .commonModes)
        }
        self.countDownTimeDict.addEntries(from: dict as! [AnyHashable : Any])//把已添加定时器的字典添加到全局字典
    }
    
    func cleanTimeAbout(){
        self.countTimeArray.removeAllObjects()
//        self.countTimeArray.perform(#selector(invalidate))
        self.countDownTimeDict.removeAllObjects()
    }
    
    @objc func numberTime(timer:Timer){

        let dic = timer.userInfo as! NSMutableDictionary
        let index = dic.object(forKey: "indexPath")
        let model : WW_ComplexOrderSingleOrderData = self.viewModel.productsArray[Int(index as! String)!]
        model.time! = model.time!-1
        if model.time! > 0{
            let indexPath = IndexPath.init(row: Int(index as! String)!,section: 0)
//            guard let cell = self.tableView.cellForRow(at:indexPath) as? WW_ComplexOrderListCell else {return}
            let cell = self.tableView.cellForRow(at:indexPath) as? WW_ComplexOrderListCell
            cell?.paymentBtn.setTitle(ordertimeFormattedWithTimeInterval(timeInterval: model.time!), for: .normal)
        }
        if model.time! <= 0{
            if model.time! == 0{
                requestData(page: self.currenPage)
            }
            timer.invalidate()
        }
    }
    
    func ordertimeFormattedWithTimeInterval(timeInterval:TimeInterval)->String{
        return "支付 " + timeInterval.minuteSecond
    }
    
    lazy var tableView : UITableView = {
        let tableView = UITableView.init(frame: CGRect.zero, style: .plain)
        tableView.register(WW_ComplexOrderListCell.classForCoder(), forCellReuseIdentifier:"myCell")
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
//            self.currenPage += 1
//            self.requestData(page: self.currenPage)
        }
        return tableView
    }()
    
}
extension WW_ComplexOrderSingPageVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.productsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! WW_ComplexOrderListCell
        let model = self.viewModel.productsArray[indexPath.row]
        cell.timeLineLabel.text = model.placedAt
        cell.collectionView.updateDate(dataArray: model.items)
        if model.status == "SUBMITTED"{
            if (model.time! > 0){
                cell.paymentBtn.setTitle(ordertimeFormattedWithTimeInterval(timeInterval: model.time!), for: .normal)
            }else{
                cell.paymentBtn.setTitle("支付超时", for: .normal)
            }
        }else{
            cell.paymentBtn.setTitle("再次购买", for: .normal)
        }
        print("paymentBtn--------",cell.paymentBtn.titleLabel?.text ?? "0","index----",indexPath.row)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 220
    }
}
