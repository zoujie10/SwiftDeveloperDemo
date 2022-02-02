//
//  WW_HomeListVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/1/1.
//  Copyright © 2022 Zoujie. All rights reserved.

//HAPPY NEW YEAR 2022.02.01

//1. UI searchTitleView +navBgImageView + collectionView
//2. Cell 注册 根据请求 取要用的cell
//3. 首页包含的Cell 注册  按请求显示需要展示的cell
//4. 数据结构返回的数组 每个type 是一个 section

import UIKit

class WW_HomeListVC: WW_MainBaseVC {
    
    let collectionCellID  = "collectionCellID"
    let homePageViewModel  = WW_HomePageListViewModel()
    
    let totalCellClassArray = [WW_HomeBannerCell.classForCoder(),
                               WW_HomePubicNoticeCell.classForCoder(),
                               WW_HomeChannelCell.classForCoder(),
                               WW_HomeChannelSingleItemCell.classForCoder(),
                               WW_HomeCouponCell.classForCoder(),
                               WW_HomeMagicCubeCell.classForCoder(),
                               WW_HomeFrequentlyBuyListCell.classForCoder(),
                               WW_HomeFreeGiftCell.classForCoder(),
                               WW_HomeSecondKillCell.classForCoder(),
                               WW_HomeRecommendsCell.classForCoder()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homePageViewModel.getHomePageList()
        configUI()
        registerAllCell()
    }
    func configUI(){
        self.view.addSubview(self.navSearchTitleView)
        self.view.addSubview(self.collectionView)
        
        self.navSearchTitleView.snp.makeConstraints { make in
            make.left.right.top.equalTo(self.view)
            make.height.equalTo(120)
        }
        self.collectionView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(self.view)
            make.top.equalTo(self.navSearchTitleView.snp_bottom)
        }
    }
    func registerAllCell(){
        for classCode : AnyClass in self.totalCellClassArray{
            self.collectionView.register(classCode, forCellWithReuseIdentifier:NSStringFromClass(classCode))
        }
    }
    
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        //滚动方向有关系:滚动方向相同的间距为minimumLineSpacing 垂直的minimumInteritemSpacing
        layout.minimumLineSpacing = 8;
        layout.minimumInteritemSpacing = 8;
        layout.scrollDirection = .vertical
        let v = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        v.backgroundColor = .clear
        v.showsVerticalScrollIndicator = true
        v.showsHorizontalScrollIndicator = false
        v.delegate = self
        v.dataSource = self
        return v
    }()
    
    lazy var navSearchTitleView : WWSearchTitleView = {
        let v = WWSearchTitleView()
        return v
    }()
}


extension WW_HomeListVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let classCell: AnyClass = self.totalCellClassArray[indexPath.section]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:NSStringFromClass(classCell), for: indexPath)
        if classCell == WW_HomeRecommendsCell.classForCoder(){
           
        }else{
          
        }
        cell.backgroundColor = UIColor.random
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.totalCellClassArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let cell: AnyClass = self.totalCellClassArray[section]
        if cell == WW_HomeRecommendsCell.classForCoder(){
            return 12
        }else{
            return 1
        }
    }
    
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cell: AnyClass = self.totalCellClassArray[indexPath.section]
        if cell == WW_HomeRecommendsCell.classForCoder(){
            return CGSize.init(width: Int(WWScreenWidth-40) / 2, height: 250)
        }else{
            return CGSize.init(width: WWScreenWidth, height: 120)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let cell: AnyClass = self.totalCellClassArray[section]
        if cell == WW_HomeRecommendsCell.classForCoder(){
            return UIEdgeInsets.init(top: 8, left: 15, bottom: 8, right: 15)
        }else{
            return UIEdgeInsets.zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.section)
    }
}
