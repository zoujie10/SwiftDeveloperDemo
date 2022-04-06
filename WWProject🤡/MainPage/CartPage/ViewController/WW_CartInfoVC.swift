//
//  WW_CartInfoVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/4/6.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_CartInfoVC: WW_MainBaseVC {

    var viewModel = WW_CartInfoViewModel()
   
    override func viewDidLoad() {
        title = "购物车"
        view.backgroundColor  =  .white
        requestData()
    }
    
    func requestData(){
        self.viewModel.reloaCartInfo {
            
        } failureBlock: { msg in
            print(msg)
        }
    }
    
}
