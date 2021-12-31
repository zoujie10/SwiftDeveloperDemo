//
//  WWSearchHotWordsVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/12/22.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class WW_SearchHotWordsVC: WW_MainBaseVC {

    var searchTitleView = WW_SearchTitleView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configUI()
    }
    func configUI(){
        self.navigationItem.titleView = self.searchTitleView
        self.searchTitleView.frame = CGRect(x: 0, y: 0, width: 270, height: 35)
        self.searchTitleView.searchWords = "旺仔牛奶"
    }
    
}
