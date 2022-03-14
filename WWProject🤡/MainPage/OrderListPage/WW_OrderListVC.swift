//
//  WW_OrderListVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/12/10.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit
import HMSegmentedControl

class WW_OrderListVC: WW_MainBaseVC {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "订单列表"
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        configUI()
    }
    

    func configUI(){
        
        self.view.addSubview(self.pageVC.view)
        self.pageVC.segment.selectedTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.red]
        self.pageVC.segment.selectionIndicatorColor = UIColor.red
        self.pageVC.segment.selectionIndicatorHeight = 6
//        self.pageVC.segment.borderColor = .white
//        self.pageVC.segment.indexChangeBlock = {
//            vcs[Int(index)].reloadByIndex(indexPage: NSInteger(index),currentPage: 1)
//        }
        self.pageVC.view.snp.makeConstraints { make in
            make.top.equalTo(85)
            make.left.right.bottom.equalTo(view)
        }
    }
    
    
    
    private lazy var pageVC: WW_OrderPageVC = {

        return WW_OrderPageVC(titles: ["全部","待回复","已回复",],
                              vcs:[WW_OrderSingleVC.init(),WW_OrderSingleVCTwo.init(),WW_OrderSingleVCThree.init()],
                                   pageStyle: .topTabBar)
    }()
    
}
