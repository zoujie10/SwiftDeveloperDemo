//
//  WW_OrderSingleVCThree.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/12/21.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class WW_OrderSingleVCThree: WW_SingleOrderBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        reloadByIndex(indexPage: 2 ,currentPage: 1)
        self.index = 2
    }
}
