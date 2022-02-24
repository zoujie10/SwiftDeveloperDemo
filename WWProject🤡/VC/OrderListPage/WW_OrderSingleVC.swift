//
//  WW_OrderSingleVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/12/11.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class WW_OrderSingleVC: WW_SingleOrderBaseVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        reloadByIndex(indexPage: 0 ,currentPage: 1)
        self.index = 0
    }
}


