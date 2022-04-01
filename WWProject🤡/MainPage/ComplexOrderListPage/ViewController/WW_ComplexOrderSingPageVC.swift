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
    
    override func viewDidLoad() {
        
        self.viewModel.reloadOrderListCurrentPage(page: 1, status: "ALL") {
            
        } failureBlock: { msg in
            
        }

    }
}
extension WW_ComplexOrderSingPageVC{
    
}
