//
//  HomeBaseCell.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/1/18.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_HomeBaseCell: UICollectionViewCell {
    typealias cellActionBlock = (_ itemLinkType : WWBHomeItemLinkType,_ itemLinkSubType :WWBHomeItemLinkSubType) -> Void
    var cellAction_block : cellActionBlock?
    
    var itemLinkType : WWBHomeItemLinkType =  WWBHomeItemLinkType.WWBHomeItemLinkTypeNone
    var itemLinkSubType : WWBHomeItemLinkSubType = WWBHomeItemLinkSubType.WWBHomeItemLinkSubTypeNone
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.contentView.layer.masksToBounds = true
        self.contentView.layer.cornerRadius = 4
        self.initContentView()
    }
    //cell 布局
    func initContentView(){}
    //更新cell 数据
    func updateData(itemData: WW_HomeItemModel){}
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
