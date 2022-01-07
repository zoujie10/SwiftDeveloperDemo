//
//  WWSearchResultVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/12/22.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class WW_SearchResultVC: WW_MainBaseVC {
    var searchTitleView = WW_SearchTitleView()
    var searchResultViewmodel = WW_SearchResultViewModel()
    var keyWord : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.searchResultViewmodel.getSearchWords(serchWord: "牛奶", currentPage: 1, pageSize: 1)
        configUI()
    }
   
    func configUI(){
        self.navigationItem.titleView = self.searchTitleView
        self.searchTitleView.frame = CGRect(x: 0, y: 0, width: 270, height: 35)
        self.searchTitleView.searchWords = "旺仔牛奶"
        self.searchTitleView.clickSearchBlock = { words in
//            self.requestHotWords(words: words as String)
        }
    }

}
/**
 1.collectionview search result  && request
 2.collectionview guess you like && request
 3.same collectionviewcell
 */
