//
//  WW_SearchResultProductsCell.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/1/7.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_SearchResultProductsCell: UICollectionViewCell {
    //加入购物车
    typealias clickAddToCartCellBlock = () -> Void
    var clickaddToCartBlock : clickAddToCartCellBlock?
    //分享
    typealias clickToShareCellBlock = () -> Void
    var clickToShareBlock : clickToShareCellBlock?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = UIColor.white
        self.layer.shadowColor = UIColor(r: 181, g: 197, b: 220).cgColor
        self.layer.shadowOffset = CGSize(width: 1, height: 0)
        self.layer.shadowOpacity = 0.36
        self.layer.shadowRadius = 3
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
        
        creatUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    func creatUI(){
        
        self.contentView.addSubview(self.productImageView)
        self.contentView.addSubview(self.nameLabel)
        self.contentView.addSubview(self.specLabel)
        self.contentView.addSubview(self.saleCountLabel)
        self.contentView.addSubview(self.priceAndUnitLabel)
        self.contentView.addSubview(self.addToCartBtn)
        self.contentView.addSubview(self.shareBtn)
        
        self.productImageView.snp.makeConstraints { make in
            make.top.left.right.equalTo(self.contentView)
            make.height.equalTo(productImageView.snp_width)
        }
        
        self.nameLabel.snp.makeConstraints { make in
            make.left.equalTo(self.contentView).offset(10)
            make.right.equalTo(self.contentView).offset(-10)
            make.top.equalTo(self.productImageView.snp_bottom).offset(10)
        }
        
        self.specLabel.snp.makeConstraints { make in
            make.left.equalTo(self.nameLabel)
            make.right.equalTo(self.nameLabel)
            make.top.equalTo(self.nameLabel.snp_bottom).offset(8)
        }
        
        self.saleCountLabel.snp.makeConstraints { make in
            make.left.equalTo(self.nameLabel)
            make.right.equalTo(self.nameLabel)
            make.top.equalTo(self.specLabel.snp_bottom).offset(8)
        }
        
        self.priceAndUnitLabel.snp.makeConstraints { make in
            make.left.equalTo(self.nameLabel)
            make.width.equalTo(100)
            make.top.equalTo(self.saleCountLabel.snp_bottom).offset(8)
        }
        
        self.addToCartBtn.snp.makeConstraints { make in
            make.centerY.equalTo(self.priceAndUnitLabel)
            make.width.height.equalTo(35)
            make.right.equalTo(self.contentView).offset(-10)
        }
    }
    //商品图
    lazy var productImageView : UIImageView = {
        let animationImageView = UIImageView()
//        animationImageView.image = UIImage(named: "cornel_branch_tree")
        return animationImageView
    }()
    //商品名称
    lazy var nameLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.backgroundColor = .white
        label.textColor = .black
        label.numberOfLines = 2
        return label;
    }()
    //商品规格
    lazy var specLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.backgroundColor = .white
        label.textColor = .black
        return label;
    }()
    //已售
    lazy var saleCountLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.backgroundColor = .white
        label.textColor = .gray
        return label;
    }()
    //商品价格+单位
    lazy var priceAndUnitLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.backgroundColor = .white
        label.textColor = .red
        return label;
    }()
    //加入购物车 按钮
    lazy var addToCartBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "ww_homes_cell_add_cart_btn_white_img"), for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(addToCart), for: .touchUpInside)
        return btn
    }()
    //分享 按钮
    lazy var shareBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("分享", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(shareProduct), for: .touchUpInside)
        return btn
    }()
    
    //活动标签
    lazy var activityTagsView : UIView = {
        let view = UIView()
        return view
    }()
    
    @objc func addToCart(){
        print("add to Cart")
    }
    
    @objc func shareProduct(){
        
    }
}
