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
        let seg = HMSegmentedControl()
        seg.sectionTitles = ["全部","待回复","已回复"]
        self.view.addSubview(seg)
        seg.snp.makeConstraints { make in
            make.top.equalTo(85)
            make.left.right.equalTo(view)
            make.height.equalTo(40)
        }
    }

}
