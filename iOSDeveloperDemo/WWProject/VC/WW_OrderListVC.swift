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

    var vcs: [WW_OrderSingleVC] = []
    
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
        self.pageVC.segment.indexChangeBlock = { [self] index in
            vcs[Int(index)].reloadByIndex(indexPage: NSInteger(index))
        }
        self.pageVC.view.snp.makeConstraints { make in
            make.top.equalTo(85)
            make.left.right.height.equalTo(view)
        }
    }
    
    
    
    private lazy var pageVC: WW_OrderPageVC = {
//        var vcs: [WW_OrderSingleVC] = []
        for _ in 0...2 {
            let vc = WW_OrderSingleVC()
            vcs.append(WW_OrderSingleVC())
        }
        return WW_OrderPageVC(titles: ["全部", "已回复", "未回复"],
                                   vcs: vcs,
                                   pageStyle: .topTabBar)
    }()
    
}
