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
        self.backgroundColor = UIColor.white
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
        self.contentView.addSubview(self.priceAndUnitLabel)
        self.contentView.addSubview(self.addToCartBtn)
        self.contentView.addSubview(self.shareBtn)
        
        
        
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
        label.textAlignment = .center
        label.backgroundColor = .orange
        label.textColor = .white
        return label;
    }()
    //商品规格
    lazy var specLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .orange
        label.textColor = .white
        return label;
    }()
    //已售
    lazy var saleCountLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .orange
        label.textColor = .white
        return label;
    }()
    //商品价格+单位
    lazy var priceAndUnitLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .orange
        label.textColor = .white
        return label;
    }()
    //加入购物车 按钮
    lazy var addToCartBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("购物车", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(addToCart), for: .touchUpInside)
        return btn
    }()
    
    lazy var shareBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("分享", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(shareProduct), for: .touchUpInside)
        return btn
    }()
    
    @objc func addToCart(){
        
    }
    
    @objc func shareProduct(){
        
    }
}
