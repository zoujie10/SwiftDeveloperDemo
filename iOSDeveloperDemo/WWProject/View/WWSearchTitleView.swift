//
//  WWSearchTitleView.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/11/21.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit
//带searchbar的搜索view
class WWSearchTitleView: UIView {

    var isOnlyJump : Bool = false
  
    override init(frame: CGRect) {
        super.init(frame: frame)

        
        makeUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeUI(){
        
    }
    
    lazy var searchBar : UISearchBar = {
        let serchBar = UISearchBar()
        return serchBar
    }()
}
