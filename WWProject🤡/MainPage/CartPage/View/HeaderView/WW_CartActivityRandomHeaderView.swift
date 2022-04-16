//
//  WW_CartSecondKillHeaderView.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/4/16.
//  Copyright © 2022 Zoujie. All rights reserved.
//
//MARK: 满赠随机送  headerview
import UIKit

class WW_CartActivityRandomHeaderView: UITableViewHeaderFooterView {

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor(r: 247, g: 247, b: 247)
        creatUI()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func creatUI() {
        
    }
}
