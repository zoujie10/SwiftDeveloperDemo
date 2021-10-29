//
//  ZJ_CollectionView.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/10/29.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class ZJ_CollectionView: UIView,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
   
    let collectionCellID  = "collectionCellID"
    let dataSource = NSArray()
    
    
    func creatUI(){
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.collectionCellID, for: indexPath) as! Cell
        return cell
    }
    lazy var collectionView : UICollectionView = {
       
        let layOut = UICollectionViewLayout()
        let collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: layOut)
        collectionView.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: self.collectionCellID)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        creatUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
}
