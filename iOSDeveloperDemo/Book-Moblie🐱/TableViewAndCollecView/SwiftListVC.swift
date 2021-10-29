//
//  SwiftListVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/10/28.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class SwiftListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        creatUI()
    }
    func creatUI(){
        self.view.addSubview(self.leftView)
        self.view.addSubview(self.rigView)
        self.leftView.snp.makeConstraints {
            $0.left.top.bottom.equalTo(self.view)
            $0.width.equalTo(120)
        }
        
        self.rigView.snp.makeConstraints {
            $0.right.top.bottom.equalTo(self.view)
            $0.width.equalTo(self.view.frame.width - 120)
        }
        
        self.leftView.update(array: ["one",
                                     "two",
                                     "three",
                                     "four",
                                     "five",
                                     "six",
                                     "seven",
                                     "eight",
                                     "nine",])
        let model1 = ZJ_ProductsModel()
        model1.ProductName = "土豆"
        model1.ProductIcon =  "计算"
        model1.productPrice = 37.22
        model1.ProductID = 100
        model1.keyInfo = "好吃的狠"
       
        let model2 = ZJ_ProductsModel()
        model2.ProductName = "玉米"
        model2.ProductIcon =  "确认订单"
        model2.productPrice = 2.22
        model2.ProductID = 99
        model2.keyInfo = "健康的狠"
        let tempArray = [model1,model2]
        self.rigView.update(array: tempArray)
        self.leftView.clickBlock = { IndexPath in
            print(IndexPath)
            
        }
    }
    
    
    
    lazy var leftView : ZJ_TableView = {
        let leftView = ZJ_TableView()
        return leftView
    }()
    
    lazy var rigView : ZJ_RightTableView = {
        let rightView = ZJ_RightTableView()
        return rightView
    }()
}
