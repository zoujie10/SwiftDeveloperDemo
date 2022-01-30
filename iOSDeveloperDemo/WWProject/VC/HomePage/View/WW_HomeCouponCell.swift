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
            make.width.height.equalTo(50)
        }
    }
  
    lazy var imageView : UIImageView = {
        let iV = UIImageView()
        iV.backgroundColor = .white
        return iV
    }()
}
class WW_HomeCouponCell: WW_HomeBaseCell {
    
    var couponDataArray = [Any]()
    
    override func initContentView() {
        super.initContentView()
        self.addSubview(self.bgView)
        self.bgView.addSubview(self.rewardCouponBtn)
        self.bgView.addSubview(self.couponCollectionView)
        
        self.bgView.snp.makeConstraints { make in
            make.edges.equalTo(UIEdgeInsets(top: 15, left: 7, bottom: -15, right: -7))
        }
        
        self.rewardCouponBtn.snp.makeConstraints { make in
            make.right.top.bottom.equalTo(self.bgView)
            make.width.equalTo((WWScreenWidth-20)/4)
        }
        
        self.couponCollectionView.snp.makeConstraints { make in
            make.left.top.bottom.equalTo(self.bgView)
            make.right.equalTo(self.rewardCouponBtn.snp_left).offset(5)
        }
    }
    
    
    @objc func rewardClick(){
        
    }
    
    lazy var rewardCouponBtn : UIButton = {
        let btn = UIButton()
        btn.addTarget(self, action: #selector(rewardClick), for: .touchUpInside)
        return btn
    }()
    
    lazy var couponCollectionView : UICollectionView = {
        let layout = WW_SearchHotWordsFlowLayout.init(with: .AlignWithLeft, betweenOfCell: 10)
        let view = UICollectionView.init(frame: CGRect(x: 0, y: 0, width:WWScreenWidth , height: WWScreenHeight), collectionViewLayout: layout)
        view.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        
        view.register(UICollectionReusableView.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headView")
        view.register(WW_SearchHotWordsCollectionCell.classForCoder(), forCellWithReuseIdentifier: "hotWordsCell")
        view.showsVerticalScrollIndicator = false
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = .clear
        view.contentSize = CGSize(width: WWScreenWidth,height: WWScreenHeight)
        return view
    }()

    lazy var bgView : UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(r: 217, g: 217, b: 217)
        v.layer.cornerRadius = 1.5
        return v
    }()

}
extension WW_HomeCouponCell : UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell : WW_HomeCouponItemsCell =  collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(WW_HomeCouponItemsCell.classForCoder()), for: indexPath) as! WW_HomeCouponItemsCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 90, height: 65)
    }
}
