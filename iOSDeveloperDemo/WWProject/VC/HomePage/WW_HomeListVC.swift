//
//  WW_HomeListVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/1/1.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_HomeListVC: WW_MainBaseVC {
    
    let homePageViewModel  = WW_HomePageListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homePageViewModel.getHomePageList()
    }
    
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        //滚动方向有关系:滚动方向相同的间距为minimumLineSpacing 垂直的minimumInteritemSpacing
        layout.minimumLineSpacing = 8;
        layout.minimumInteritemSpacing = 8;
        layout.scrollDirection = .vertical
        let v = UICollectionView.init(frame: .zero)
        v.backgroundColor = .clear
        v.showsVerticalScrollIndicator = true
        v.showsHorizontalScrollIndicator = false
        v.delegate = self
        v.dataSource = self
        return v
    }()
}


extension WW_HomeListVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as UICollectionViewCell
        return cell
    }
    
    
   
}
