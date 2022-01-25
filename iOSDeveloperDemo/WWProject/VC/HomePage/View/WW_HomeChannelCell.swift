//
//  WW_HomeChannelCell.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/1/22.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_HomeChannelCell: WW_HomeBaseCell {
    let kCellWidth = WWScreenWidth/5.0
    let kIndicatiorBgWidth = 50
    
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
            make.size.equalTo(CGSize(width: self.kIndicatiorBgWidth, height: 3))
        }
        
        self.indicatorView.snp.makeConstraints { make in
            make.left.centerY.equalTo(self.indicatorBgView)
            make.size.equalTo(CGSize(width: 0, height: 3))
        }
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
//        let index = indexPath.item * 2
        let cell : WW_HomeChannelSubCell =  collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(WW_HomeChannelSubCell.classForCoder()), for: indexPath) as! WW_HomeChannelSubCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20/2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.kCellWidth, height: collectionView.frame.size.height)
    }
}
