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
    
    //跳转 type
    var itemLinkType : WWBHomeItemLinkType =  WWBHomeItemLinkType.WWBHomeItemLinkTypeNone
    var itemLinkSubType : WWBHomeItemLinkSubType = WWBHomeItemLinkSubType.WWBHomeItemLinkSubTypeNone
    
    ////传viewmodel 直接赋值  待优化 存跳转的数组
    var detailModelArray = [WW_HomeItemDetailModel]()
    var imageUrlArray = [String]()
    var typeArray = [String]()
    var subTypeArray = [String]()
    
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
    //更新 推荐商品 列表 数据
    func updateGoodlistData(itemData : WW_HomeItemDetailModel){}
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
