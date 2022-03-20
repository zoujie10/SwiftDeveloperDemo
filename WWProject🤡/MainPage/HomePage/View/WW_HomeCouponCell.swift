//
//  WW_HomeCouponCell.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/1/22.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit
//TODO 分别有显示1,2,3三种样式
/**
   1.布局 bgview + collectionview + rewardCouponBtn
 */

class WW_HomeCouponItemsCell : UICollectionViewCell{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setSubView(){
        self.contentView.addSubview(self.imageView)
        self.imageView.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.edges.equalTo(UIEdgeInsets(top: 10, left: 5, bottom: -5, right: -5))
        }
    }
  
    lazy var imageView : UIImageView = {
        let iV = UIImageView()
        iV.backgroundColor = .white
        return iV
    }()
}
class WW_HomeCouponCell: WW_HomeBaseCell {
    
    override func initContentView() {
        super.initContentView()
        self.addSubview(self.bgView)
        self.bgView.addSubview(self.couponCollectionView)
        self.bgView.snp.makeConstraints { make in
            make.edges.equalTo(UIEdgeInsets(top: 0, left: 7, bottom: 0, right: 7))
        }
        
        self.couponCollectionView.snp.makeConstraints { make in
            make.left.top.bottom.equalTo(self.bgView)
            make.right.equalTo(self.bgView)
        }
    }
    override func updateData(itemData: WW_HomeItemModel) {
        self.detailModelArray = NSArray.init(array: itemData.configureAttribute!) as! [WW_HomeItemDetailModel]
        
    }
    
    lazy var couponCollectionView : UICollectionView = {

        let layout = UICollectionViewFlowLayout.init()
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        let view = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        
        view.autoresizingMask = [.flexibleWidth,.flexibleHeight]
    
        view.register(WW_HomeCouponItemsCell.classForCoder(), forCellWithReuseIdentifier: NSStringFromClass(WW_HomeCouponItemsCell.classForCoder()))
        view.showsVerticalScrollIndicator = false
        view.isScrollEnabled = false
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = .clear
        return view
    }()

    lazy var bgView : UIView = {
        let v = UIView()
//        v.backgroundColor = UIColor(r: 217, g: 217, b: 217)
        v.backgroundColor = .clear
        v.layer.cornerRadius = 1.5
        return v
    }()

}
extension WW_HomeCouponCell : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell : WW_HomeCouponItemsCell =  collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(WW_HomeCouponItemsCell.classForCoder()), for: indexPath) as! WW_HomeCouponItemsCell

        let model = self.detailModelArray[indexPath.item]
        cell.imageView.kf.setImage(with:URL.init(string: model.pictureURL!))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.detailModelArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if self.cellAction_block != nil{
            let model =  self.detailModelArray[indexPath.item]
            self.itemLinkType = WWBHomeItemLinkType.init(rawValue: Int(model.linkPOP?.type! ?? "0")!)!
            if model.linkPOP?.type == "3"{
                self.itemLinkSubType = WWBHomeItemLinkSubType.init(rawValue: Int(model.linkPOP?.content! ?? "0")!)!
            }
            self.cellAction_block!(self.itemLinkType,self.itemLinkSubType)
        }
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let lastItemWidth = 80
        if indexPath.row == (self.detailModelArray.count-1){
            return CGSize(width: lastItemWidth, height: Int(collectionView.frame.size.height)-10)
        }else{
            return CGSize(width: (collectionView.frame.size.width-CGFloat(lastItemWidth)-20)/CGFloat((self.detailModelArray.count-1)), height: collectionView.frame.size.height-10)
        }
    }
    
}
