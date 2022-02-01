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

import UIKit

class WW_HomeListVC: WW_MainBaseVC {
    
    let collectionCellID  = "collectionCellID"
    let homePageViewModel  = WW_HomePageListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homePageViewModel.getHomePageList()
        configUI()
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
        v.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: self.collectionCellID)
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellID, for: indexPath) as UICollectionViewCell
        return cell
    }
    
    
   
}
