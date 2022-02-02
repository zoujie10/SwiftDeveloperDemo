//
//  WW_HomeChannelSingleItemCell.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/1/24.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_HomeChannelSingleItemCell: WW_HomeBaseCell {
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
    }
    
    override func updateData<T>(itemData: T) where T : NSObject {
        
        self.collectionView.reloadData()
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
//        if (self.itemViewModel.itemDetailCount >= 10) {
//            return (self.itemViewModel.itemDetailCount + 1) / 2;
//        } else {
//            return self.itemViewModel.itemDetailCount;
//        }
        return 20 //data.count
    }
    
    func isShowIndicator() -> Bool{
//        return (data.count > 5 &&
//                data.count != 10);
        return true
    }
    
    lazy var collectionView : UICollectionView = {
        let c = UICollectionView.init(frame: .zero, collectionViewLayout: self.layout)
        c.backgroundColor = .clear
        c.delegate = self
        c.dataSource = self
        c.showsHorizontalScrollIndicator = false
        c.register(WW_HomeChannelSingleItemSubCell.classForCoder(), forCellWithReuseIdentifier: NSStringFromClass(WW_HomeChannelSingleItemSubCell.classForCoder()))
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

extension WW_HomeChannelSingleItemCell: UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell : WW_HomeChannelSingleItemSubCell =  collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(WW_HomeChannelSingleItemSubCell.classForCoder()), for: indexPath) as! WW_HomeChannelSingleItemSubCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.kCellWidth, height: 65)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let cellCount : NSInteger = self.cellCount()
        var offsetX : Float = Float(scrollView.contentOffset.x * CGFloat((self.kIndicatiorBgWidth/CGFloat(cellCount)))/self.kCellWidth)
        offsetX = max(offsetX, 0)
        let indicatorWidth : CGFloat = (self.kIndicatiorBgWidth / CGFloat(cellCount) * 5)
        offsetX = min(offsetX, Float(self.kIndicatiorBgWidth) - Float(indicatorWidth))
        
        self.indicatorView.snp.updateConstraints { make in
            make.width.equalTo(self.indicatorBgView).offset(offsetX)
        }
        
    }
}
