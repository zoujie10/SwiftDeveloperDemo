//
//  SwiftListVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/10/28.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class SwiftListVC: UIViewController {
    let viewModel = ZJ_ProductsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ListVC"
        self.view.backgroundColor = UIColor.white
        request()
        creatUI()
        creatNav()
    }
    
    func request(){
        self.viewModel.requestLeftTag()
        self.viewModel.dataComplete = {
            self.viewModel.selectedAtRowCell(row: 0)
            let array:[categoryInfoItemModel] = self.viewModel.tagsArray
            
            self.leftView.update(array:array)
        }
        self.viewModel.dataProductComplete = {
            let source : [WW_ProductListInfoModel] = self.viewModel.productsArray
            self.rightView.update(array: source)
        }
    }
    func creatNav(){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "ww_navs_main_back_bar_btn_img_3"), style: .plain, target: self, action: #selector(click_back))
    }
    @objc func click_back(){
        self.navigationController?.popViewController(animated: true)
    }
    func creatUI(){
        self.view.addSubview(self.leftView)
        self.view.addSubview(self.rightView)
        self.view.addSubview(self.rigCollectionView)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .done, target: self, action: #selector(changeRightView))
       
        self.leftView.snp.makeConstraints {
            $0.left.top.bottom.equalTo(self.view)
            $0.width.equalTo(120)
        }
        
        self.rightView.snp.makeConstraints {
            $0.right.top.bottom.equalTo(self.view)
            $0.width.equalTo(self.view.frame.width - 120)
        }
        
        self.rigCollectionView.snp.makeConstraints {
            $0.right.top.bottom.equalTo(self.view)
            $0.width.equalTo(self.view.frame.width - 120)
        }
        
        self.leftView.clickBlock = { IndexPath in
            print(IndexPath)
            self.viewModel.selectedAtRowCell(row: IndexPath.row)
            self.leftView.update(array: self.viewModel.tagsArray)
            
            let model : categoryInfoItemModel = self.viewModel.tagsArray[IndexPath.row]
            self.viewModel.requestRightByMoya(catkey: model.code)
        }
        
        self.rightView.clickBlock = { IndexPath in
            if(IndexPath.section == 2 && IndexPath.row == 1){
                let vc = SwiftTableViewEditVC()
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    @objc func changeRightView(){
        self.rightView.isHidden = !self.rightView.isHidden
        self.rigCollectionView.isHidden = !self.rigCollectionView.isHidden
    }
    
    
    lazy var leftView : ZJ_TableView = {
        let leftView = ZJ_TableView()
        return leftView
    }()
    
    lazy var rightView : ZJ_RightTableView = {
        let rightView = ZJ_RightTableView()
        rightView.isHidden = false
        return rightView
    }()
    
    lazy var rigCollectionView : ZJ_CollectionView = {
        let rigCollectionView = ZJ_CollectionView()
        rigCollectionView.isHidden = true
        return rigCollectionView
    }()
}
