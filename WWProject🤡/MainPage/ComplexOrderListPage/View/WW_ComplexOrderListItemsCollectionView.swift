//
//  WW_ComplexOrderListItemsCollectionView.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/4/2.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit
class WW_ComplexOrderListItem : UICollectionViewCell{
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        creatUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func creatUI(){
        self.addSubview(self.imageIconView)
        self.imageIconView.snp.makeConstraints {
            $0.centerX.equalTo(self)
            $0.top.equalTo(self).offset(10)
            $0.width.height.equalTo(80)
        }
    }
    
    lazy var imageIconView : UIImageView = {
        let imageIconView = UIImageView()
        imageIconView.layer.opacity = 0.5
        imageIconView.tag = 1
        return imageIconView
    }()
}

class WW_ComplexOrderListItemsCollectionView: UIView,UICollectionViewDelegate,UICollectionViewDataSource {

    let collectionCellID  = "collectionCellID"
    var dataSource = [WW_ComplexOrderSingleProductItem]()
    
    func creatUI(){
        
        self.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints {
            $0.edges.equalTo(self)
        }
        
    }
    func updateDate(dataArray:[WW_ComplexOrderSingleProductItem]){
        self.dataSource = dataArray
        self.collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        let imageView = cell?.viewWithTag(1)
        imageView?.layer.opacity = 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.collectionCellID, for: indexPath) as! WW_ComplexOrderListItem
        let imageName =  self.dataSource[indexPath.row].itemImageNames ?? "搜索"
        cell.imageIconView.kf.setImage(with: URL.init(string: imageName))
        cell.imageIconView.kf.indicatorType = .activity
        return cell
    }
    lazy var collectionView : UICollectionView = {
       
        let layOut = UICollectionViewFlowLayout()
        layOut.itemSize = CGSize.init(width: 100, height: 100)
        layOut.scrollDirection = .horizontal
        layOut.minimumLineSpacing = 0.1
    
        let collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: layOut)
        collectionView.register(WW_ComplexOrderListItem.classForCoder(), forCellWithReuseIdentifier: self.collectionCellID)
        collectionView.backgroundColor = UIColor.white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        creatUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
}
