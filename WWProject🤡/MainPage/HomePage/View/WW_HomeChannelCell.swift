//
//  WW_HomeChannelCell.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/1/22.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_HomeChannelCell: WW_HomeBaseCell {
    let kCellWidth : CGFloat = CGFloat(WWScreenWidth/5.0)
    let kIndicatiorBgWidth : CGFloat = 50.00
    
    override func initContentView() {
        super.initContentView()
        self.contentView.addSubview(self.collectionView)
        self.contentView.addSubview(self.indicatorBgView)
        self.contentView.addSubview(self.indicatorView)
        
        self.collectionView.snp.makeConstraints { make in
            make.left.right.equalTo(self.contentView)
            make.top.equalTo(self.contentView).offset(5)
            make.bottom.equalTo(self.contentView).offset(-20)
        }
        
        self.indicatorBgView.snp.makeConstraints { make in
            make.centerX.equalTo(self.contentView)
            make.top.equalTo(self.collectionView.snp_bottom).offset(10)
            make.size.equalTo(CGSize(width: self.kIndicatiorBgWidth, height: 3.00))
        }
        
        self.indicatorView.snp.makeConstraints { make in
            make.left.centerY.equalTo(self.indicatorBgView)
            make.size.equalTo(CGSize(width: 0, height: 3))
        }
        calculateIndicatorWidth()
    }
    
    override func updateData(itemData: WW_HomeItemModel) {
        if itemData.configureAttribute?.count ?? 0 > 0 {
            self.detailModelArray = NSArray.init(array: itemData.configureAttribute!) as! [WW_HomeItemDetailModel]
            for item : WW_HomeItemDetailModel in itemData.configureAttribute!{
                self.typeArray.append(item.linkPOP?.type ?? "0")
                if item.linkPOP?.type == "1"{
                    self.subTypeArray.append("0")
                }else{
                    self.subTypeArray.append(item.linkPOP?.content ?? "0")
                }
            }
            self.collectionView.reloadData()
        }
    }
    
    func calculateIndicatorWidth(){
        let cellCount : NSInteger = self.cellCount()
        var width : CGFloat = (self.kIndicatiorBgWidth / CGFloat(cellCount) * 5)
        width = min(width, CGFloat(self.kIndicatiorBgWidth))
        self.indicatorView.snp.updateConstraints { make in
            make.width.equalTo(width)
        }
    }
    func cellCount() -> NSInteger{
//        if data.count % 2{
//            return data.count/2 + 1
//        }
        return self.detailModelArray.count/2
    }
    
    func isShowIndicator() -> Bool{
        return true //data.count > 0
    }
    lazy var collectionView : UICollectionView = {
        let c = UICollectionView.init(frame: .zero, collectionViewLayout: self.layout)
        c.backgroundColor = .clear
        c.delegate = self
        c.dataSource = self
        c.showsHorizontalScrollIndicator = false
        c.register(WW_HomeChannelSubCell.classForCoder(), forCellWithReuseIdentifier: NSStringFromClass(WW_HomeChannelSubCell.classForCoder()))
        return c
    }()
    lazy var layout :UICollectionViewFlowLayout = {
        let l = UICollectionViewFlowLayout()
        l.minimumLineSpacing = 0
        l.minimumInteritemSpacing = 0
        l.sectionInset = .zero
        l.scrollDirection = .horizontal
        return l
    }()
    lazy var indicatorBgView : UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(r: 217, g: 217, b: 217)
        v.layer.cornerRadius = 1.5
        return v
    }()
    lazy var indicatorView : UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(r: 264, g: 47, b: 71)
        v.layer.cornerRadius = 1.5
        return v
    }()
}

extension WW_HomeChannelCell : UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : WW_HomeChannelSubCell =  collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(WW_HomeChannelSubCell.classForCoder()), for: indexPath) as! WW_HomeChannelSubCell
        let index = indexPath.item * 2
        let upModel = self.detailModelArray[index]
        let downModel = self.detailModelArray[index + 1]
        cell.upLabel.text = upModel.pictureName
        cell.downLabel.text = downModel.pictureName
        cell.upImageView.kf.setImage(with: URL.init(string: upModel.pictureURL!))
        cell.upImageView.kf.indicatorType = .activity
        
        cell.downImageView.kf.setImage(with: URL.init(string: downModel.pictureURL!))
        cell.downImageView.kf.indicatorType = .activity
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.detailModelArray.count/2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.kCellWidth, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if self.cellAction_block != nil{
            self.itemLinkType = WWBHomeItemLinkType.init(rawValue: Int(self.typeArray[indexPath.item])!)!
            self.itemLinkSubType = WWBHomeItemLinkSubType.init(rawValue: Int(self.subTypeArray[indexPath.item])!)!
            
            self.cellAction_block!(self.itemLinkType,self.itemLinkSubType)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let cellCount : NSInteger = self.cellCount()
        var offsetX : Float = Float(scrollView.contentOffset.x * CGFloat((self.kIndicatiorBgWidth/CGFloat(cellCount)))/self.kCellWidth)
        offsetX = max(offsetX, 0)
        let indicatorWidth : CGFloat = (self.kIndicatiorBgWidth / CGFloat(cellCount) * 5)
        offsetX = min(offsetX, Float(self.kIndicatiorBgWidth) - Float(indicatorWidth))
        
        self.indicatorView.snp.updateConstraints { make in
            make.left.equalTo(self.indicatorBgView).offset(offsetX)
        }
    }
}
