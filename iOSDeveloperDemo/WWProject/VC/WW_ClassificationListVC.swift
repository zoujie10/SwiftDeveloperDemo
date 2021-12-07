//
//  WWClassificationVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/11/21.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit
//分类 VC
class WW_ClassificationListVC: WW_MainBaseVC {

    let leftViewModel = WW_ClassificationLeftTagsViewModel()
    let rightViewModel = WW_ClassificationRightProductsViewModel()
    
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
        self.leftViewModel.dataComplete = {
            self.leftViewModel.selectedAtRowCell(row: 0)
            let array:[WW_CategoryInfoItemModel] = self.leftViewModel.tagsArray
            let model : WW_CategoryInfoItemModel = self.leftViewModel.tagsArray[0]
            self.rightViewModel.requestRightByMoya(catkey: model.code)
            self.leftView.update(array:array)
        }
       
        self.rightViewModel.dataProductComplete = {
            let source : [WW_ProductListInfoModel] = self.rightViewModel.productsArray
            self.rightView.update(array: source)
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
    }
    func configInteraction(){
        self.leftView.clickBlock = { IndexPath in
            print(IndexPath)
            self.leftViewModel.selectedAtRowCell(row: IndexPath.row)
            self.leftView.update(array: self.leftViewModel.tagsArray)
            let model : WW_CategoryInfoItemModel = self.leftViewModel.tagsArray[IndexPath.row]
            self.rightViewModel.requestRightByMoya(catkey: model.code)
        }
        
        self.rightView.clickPushBlock = { IndexPath in
            debugPrint(IndexPath.row)
        }
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
