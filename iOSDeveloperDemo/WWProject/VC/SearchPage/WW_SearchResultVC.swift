//
//  WWSearchResultVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/12/22.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class WW_SearchResultVC: WW_MainBaseVC {
    var searchResultViewmodel = WW_SearchResultViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.searchResultViewmodel.getSearchWords(ptkey: "1", currentPage: 1, pageSize: 1)
    }
    

}
/**
 1.collectionview search result  && request
 2.collectionview guess you like && request
 3.same collectionviewcell
 */
