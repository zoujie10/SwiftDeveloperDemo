//
//  ZJ_CollectionView.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/10/29.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class ZJ_CollectionView: UIView,UICollectionViewDelegate,UICollectionViewDataSource{
    
    let collectionCellID  = "collectionCellID"
    var dataSource = Array<ZJ_ProductsModel>()
    
    func creatUI(){
        
        self.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints {
            $0.edges.equalTo(self)
        }
        
        let model1 = ZJ_ProductsModel()
        model1.ProductName = "土豆"
        model1.ProductIcon =  "计算"
        model1.productPrice = 37.22
        model1.ProductID = 100
        model1.keyInfo = "好吃的狠"
       
        let model2 = ZJ_ProductsModel()
        model2.ProductName = "玉米"
        model2.ProductIcon =  "确认订单"
        model2.productPrice = 2.22
        model2.ProductID = 99
        model2.keyInfo = "健康的狠"
        
        self.dataSource.append(model1)
        self.dataSource.append(model2)
        
        for i in 1...3{
            let model3 = ZJ_ProductsModel()
            model3.ProductName = "豆浆+\(i)"
            model3.ProductIcon =  "运营报告"
            model3.productPrice = 1.00
            model3.ProductID = 98
            if i == 2{
                model3.keyInfo = "去编辑tableview页面吧+\(i)"
            }else{
                model3.keyInfo = "好喝的狠+\(i)"
            }
            self.dataSource.append(model3)
        }
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.collectionCellID, for: indexPath) as! ZJ_ProductCollectionCell
        cell.imageIconView.image = UIImage.init(named: self.dataSource[indexPath.row].ProductIcon ?? "搜索")
        let str = self.dataSource[indexPath.row].ProductName
        cell.productTitleLabel.text = str
        return cell
    }
    lazy var collectionView : UICollectionView = {
       
        let layOut = UICollectionViewFlowLayout()
        layOut.itemSize = CGSize.init(width: 100, height: 120)
       
        let collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: layOut)
        collectionView.register(ZJ_ProductCollectionCell.classForCoder(), forCellWithReuseIdentifier: self.collectionCellID)
        collectionView.backgroundColor = UIColor.white
        collectionView.delegate = self
        collectionView.dataSource = self
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
