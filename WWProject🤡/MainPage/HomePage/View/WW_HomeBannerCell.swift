//
//  WW_HomeBannerCell.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/1/19.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit
import SDCycleScrollView

class WW_HomeBannerSubCell : UICollectionViewCell{
    public var _urlString : String?
    var urlString : String {
        get{
            return (_urlString)!
        }
        set{
            _urlString = newValue
            self.imageView.kf.setImage(with: URL.init(string: _urlString!))
            self.imageView.kf.indicatorType = .activity
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpSubviews()
    }
    
    func setUpSubviews(){
        self.contentView.addSubview(self.imageView)
        self.contentView.addSubview(self.defaultImageView)
        
        self.imageView.snp.makeConstraints { make in
            make.left.equalTo(self.contentView).offset(15)
            make.right.equalTo(self.contentView).offset(-15)
            make.top.bottom.equalTo(self.contentView)
        }
        
        self.defaultImageView.snp.makeConstraints { make in
            make.center.equalTo(self.contentView)
        }
    }
    
    lazy var imageView : UIImageView = {
        let iV = UIImageView()
        iV.backgroundColor = UIColor(r: 236, g: 236, b: 236)
        iV.layer.cornerRadius = 8.0
        iV.layer.masksToBounds = true
        return iV
    }()
    
    lazy var defaultImageView : UIImageView = {
        let iV = UIImageView()
        iV.image = UIImage(named: "")
        return iV
    }()
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class WW_HomeBannerCell: WW_HomeBaseCell,SDCycleScrollViewDelegate {
  
    typealias scrollBlock = (String) -> Void
    var scrollBlock : scrollBlock?
    
    override func initContentView(){
        super.initContentView()
        self.setUpSubviews()
    }
    
    func setUpSubviews(){
        self.contentView.addSubview(self.cycleScrollView)
        self.cycleScrollView.snp.makeConstraints { make in
            make.left.right.equalTo(self.contentView)
            make.top.equalTo(self.contentView).offset(5)
            make.bottom.equalTo(self.contentView).offset(-5)
        }
        
        self.cycleScrollView.clickItemOperationBlock = {currentIndex in
            print("clickItemOperationBlock ---\(currentIndex)")
            if self.cellAction_block != nil{
                let model =  self.detailModelArray[currentIndex]
                self.itemLinkType = WWBHomeItemLinkType.init(rawValue: Int(model.linkPOP?.type! ?? "0")!)!
                self.itemLinkSubType = WWBHomeItemLinkSubType.init(rawValue: Int(model.linkPOP?.content! ?? "0")!)!
                self.cellAction_block!(self.itemLinkType,self.itemLinkSubType)
            }
        }
        
        self.cycleScrollView.itemDidScrollOperationBlock = { currentIndex in
            if self.scrollBlock != nil{
                let model =  self.detailModelArray[currentIndex]
                self.scrollBlock!(model.singleBackgroundURL!)
            }
        }
    }
    
    override func updateData(itemData: WW_HomeItemModel) {
        var imageUrlArr = [String]()
        if itemData.configureAttribute?.count ?? 0 > 0 {
            self.detailModelArray = NSArray.init(array: itemData.configureAttribute!) as! [WW_HomeItemDetailModel]
            
            for item : WW_HomeItemDetailModel in self.detailModelArray{
                imageUrlArr.append(item.pictureURL!)
            }
        }
        self.cycleScrollView.imageURLStringsGroup = imageUrlArr
    }
    
    func customCollectionViewCellClass(for view: SDCycleScrollView!) -> AnyClass! {
        return WW_HomeBannerSubCell.classForCoder()
    }
    
    func setupCustomCell(_ cell: UICollectionViewCell!, for index: Int, cycleScrollView view: SDCycleScrollView!) {

        if index < self.detailModelArray.count{
            let subCell = cell as! WW_HomeBannerSubCell
          let model =  self.detailModelArray[index]
            subCell.urlString = model.pictureURL!
        }
    }
    
    lazy var cycleScrollView : SDCycleScrollView = {
        let cycle = SDCycleScrollView()
        cycle.delegate = self
        cycle.backgroundColor = .clear
        cycle.autoScrollTimeInterval = 3.0
        cycle.currentPageDotImage = UIImage(named: "ww_homes_banner_page_control_default_img")
        cycle.pageDotImage = UIImage(named: "ww_homes_banner_page_control_current_img")
        return cycle
    }()
}
