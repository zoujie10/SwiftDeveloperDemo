//
//  WW_HomeListVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/1/1.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_HomeListVC: WW_MainBaseVC {
    
    let homePageViewModel  = WW_HomePageListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homePageViewModel.getHomePageList()
    }
    
}
