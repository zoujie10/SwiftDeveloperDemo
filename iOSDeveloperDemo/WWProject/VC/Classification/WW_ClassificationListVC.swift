//
//  WWClassificationVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/11/21.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit
import MJRefresh
//分类 VC
class WW_ClassificationListVC: WW_MainBaseVC {

    let leftViewModel = WW_ClassificationLeftTagsViewModel()
    let rightViewModel = WW_ClassificationRightProductsViewModel()
    var header = WW_RefreshStateHeader()
    var footer = WW_RefreshAutoGifFooter()
    var selectLeftRow = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "分类"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 252/255, green: 85/255, blue: 108/255, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        requestNet()
        makeUI()
        configInteraction()
    }
    
    func requestNet(){
        self.leftViewModel.requestLeftTag()
        self.leftViewModel.dataComplete = { [self] in
            self.leftViewModel.selectedAtRowCell(row: 0)
            let array:[WW_CategoryInfoItemModel] = self.leftViewModel.tagsArray
            let model : WW_CategoryInfoItemModel = self.leftViewModel.tagsArray[0]
            self.requestRightProduct(code: model.code)
            self.leftView.update(array:array)
        }
    }
    
    func requestRightProduct(code : String){
        self.rightViewModel.requestRightByMoya(catkey: code)
        
        self.rightViewModel.dataProductComplete = { [self] in
            let source : [WW_ProductListInfoModel] = self.rightViewModel.productsArray
            self.rightView.update(array: source)
            configRefreshContext()
            self.rightView.tableView.mj_header?.endRefreshing()
            self.rightView.tableView.mj_footer?.endRefreshing()
        }
    }
    
    func makeUI(){
        view.addSubview(self.leftView)
        view.addSubview(self.rightView)
        
        self.leftView.snp.makeConstraints {
            $0.left.top.bottom.equalTo(self.view)
            $0.width.equalTo(120)
        }
        
        self.rightView.snp.makeConstraints {
            $0.right.top.bottom.equalTo(self.view)
            $0.width.equalTo(self.view.frame.width - 120)
        }
        
        header.setRefreshingTarget(self, refreshingAction:#selector(headerRefresh))
        header.lastUpdatedTimeLabel?.isHidden = true
        header.stateLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        header.stateLabel?.textColor = UIColor(red: 184/255, green: 184/255, blue: 184/255, alpha: 1)

        self.rightView.tableView.mj_header = header
        
        footer.setRefreshingTarget(self, refreshingAction: #selector(footerRefresh))
//        footer.isAutomaticallyRefresh = false
        footer.stateLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        footer.stateLabel?.textColor = UIColor(red: 184/255, green: 184/255, blue: 184/255, alpha: 1)
        self.rightView.tableView.mj_footer = footer
        self.rightView.tableView.mj_footer?.isHidden = true
    }
    //MARK:点击tableview cell
    func configInteraction(){
        self.leftView.clickBlock = { [self] IndexPath in
           
            self.selectLeftRow = IndexPath.row
            self.leftViewModel.selectedAtRowCell(row: IndexPath.row)
            self.leftView.update(array: self.leftViewModel.tagsArray)
            configRefreshContext()
            let model : WW_CategoryInfoItemModel = self.leftViewModel.tagsArray[IndexPath.row]
            self.rightViewModel.requestRightByMoya(catkey: model.code)
        }
        
        self.rightView.clickPushBlock = { IndexPath in
            debugPrint(IndexPath.row)
        }
    }
    
    func configRefreshContext(){
        if(self.selectLeftRow == 0){
            self.rightView.tableView.mj_header?.isHidden = true
            self.rightView.tableView.mj_footer?.isHidden = false
            let str = self.leftViewModel.tagsArray[self.selectLeftRow+1].displayName
            setFooterTitle(productName: str)
        }else if self.selectLeftRow == self.leftViewModel.tagsArray.count - 1{
            self.rightView.tableView.mj_header?.isHidden = false
            self.rightView.tableView.mj_footer?.isHidden = true
            let str = self.leftViewModel.tagsArray[self.selectLeftRow-1].displayName
            setHeaderTitle(productName: str)
        }else{
            self.rightView.tableView.mj_header?.isHidden = false
            self.rightView.tableView.mj_footer?.isHidden = false
            let headerStr = self.leftViewModel.tagsArray[self.selectLeftRow-1].displayName
            let footerStr = self.leftViewModel.tagsArray[self.selectLeftRow+1].displayName
            setHeaderTitle(productName: headerStr)
            setFooterTitle(productName: footerStr)
        }
    }
    func setHeaderTitle(productName: String){
        let str = "拉下继续浏览 \(productName)"
        header.configRefreshContext(title: str)
    }
    
    func setFooterTitle(productName: String){
        let str = "上拉继续浏览 \(productName)"
        footer.configFooterRefreshContext(title: str)
    }
    
    @objc func headerRefresh(){
        self.selectLeftRow -= 1
        self.leftViewModel.selectedAtRowCell(row: self.selectLeftRow)
        self.leftView.update(array: self.leftViewModel.tagsArray)
        
        let model : WW_CategoryInfoItemModel = self.leftViewModel.tagsArray[selectLeftRow]
        self.requestRightProduct(code: model.code)
        
        
    }
    
    @objc func footerRefresh(){
        self.selectLeftRow += 1
        self.leftViewModel.selectedAtRowCell(row: self.selectLeftRow)
        self.leftView.update(array: self.leftViewModel.tagsArray)
        
        let model : WW_CategoryInfoItemModel = self.leftViewModel.tagsArray[selectLeftRow]
        self.requestRightProduct(code: model.code)

//        self.rightView.tableView.mj_footer?.endRefreshing()
    }

    lazy var leftView : WW_TagsTableView = {
        let leftView = WW_TagsTableView()
        return leftView
    }()
    
    lazy var rightView : WW_RightTableView = {
        let rightView = WW_RightTableView()
        rightView.isHidden = false
        return rightView
    }()
    
}
