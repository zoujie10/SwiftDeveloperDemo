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
    
    var couponDataArray = [Any]()
    
    override func initContentView() {
        super.initContentView()
        self.addSubview(self.bgView)
        self.bgView.addSubview(self.rewardCouponBtn)
        self.bgView.addSubview(self.couponCollectionView)
        
        self.bgView.snp.makeConstraints { make in
            make.edges.equalTo(UIEdgeInsets(top: 0, left: 7, bottom: 0, right: -7))
        }
        
        self.rewardCouponBtn.snp.makeConstraints { make in
            make.right.equalTo(self.bgView.snp_right).offset(-10)
            make.top.equalTo(self.bgView).offset(10)
            make.bottom.equalTo(self.bgView).offset(-10)
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
        btn.backgroundColor = .white
        return btn
    }()
    
    lazy var couponCollectionView : UICollectionView = {
        let layout = WW_SearchHotWordsFlowLayout.init(with: .AlignWithCenter, betweenOfCell: 5)
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
        if(indexPath.row == 0){
            cell.imageView.kf.setImage(with:URL.init(string: "https://hotkidceo-1251330842.cos.ap-shanghai.myqcloud.com/2021061617114800077.png"))
        }else if(indexPath.row == 1){
            cell.imageView.kf.setImage(with:URL.init(string: "https://hotkidceo-1251330842.cos.ap-shanghai.myqcloud.com/2021061617115500078.png"))
        }else if(indexPath.row == 2){
            cell.imageView.kf.setImage(with:URL.init(string: "https://hotkidceo-1251330842.cos.ap-shanghai.myqcloud.com/2021061617120200079.png"))
        }else if (indexPath.row == 3){
            let imageview = UIImageView()
            imageview.kf.setImage(with:URL.init(string: "https://hotkidceo-1251330842.cos.ap-shanghai.myqcloud.com/2021061617121800080.png"))
            self.rewardCouponBtn.setImage(imageview.image, for: .normal)
        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width-30)/3, height: collectionView.frame.size.height-10)
    }
}
