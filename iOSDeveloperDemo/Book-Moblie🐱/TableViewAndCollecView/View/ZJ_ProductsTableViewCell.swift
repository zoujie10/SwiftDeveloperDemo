//
//  ZJ_ProductsTableViewCell.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/10/29.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class ZJ_ProductsTableViewCell: UITableViewCell {

 
    func creatUI(){
        self.contentView.addSubview(self.iconImageView)
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.desLabel)
        self.contentView.addSubview(self.priceLable)
        self.contentView.addSubview(self.buyCartBtn)
        
        self.iconImageView.snp.makeConstraints {
            $0.top.left.equalTo(self.contentView).offset(10)
            $0.width.height.equalTo(80)
        }
        self.titleLabel.snp.makeConstraints {
            $0.top.equalTo(self.iconImageView.snp_top)
            $0.left.equalTo(self.iconImageView.snp_right).offset(10)
        }
        self.desLabel.snp.makeConstraints {
            $0.left.equalTo(self.titleLabel.snp_left)
            $0.top.equalTo(self.titleLabel.snp_bottom).offset(10)
        }
        self.priceLable.snp.makeConstraints {
            $0.left.equalTo(self.titleLabel.snp_left)
            $0.top.equalTo(self.iconImageView.snp_bottom).offset(-10)
        }
        self.buyCartBtn.snp.makeConstraints {
            $0.centerY.equalTo(self.priceLable)
            $0.width.height.equalTo(35)
            $0.right.equalTo(self.contentView).offset(-10)
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.isUserInteractionEnabled = true
        self.selectionStyle = .default
        creatUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var iconImageView : UIImageView = {
        let iconImageView = UIImageView()
        return iconImageView
    }()
    
    lazy var titleLabel : UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "商品名"
        titleLabel.textColor = UIColor.black
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 2
        return titleLabel
    }()
    
    lazy var desLabel : UILabel = {
       let desLabel = UILabel()
        desLabel.text = "商品描述"
        desLabel.textColor = UIColor.lightGray
        desLabel.textAlignment = .left
        return desLabel
    }()
    
    lazy var priceLable : UILabel = {
        let priceLable = UILabel()
        priceLable.text = "￥4.01"
        priceLable.textColor = UIColor.red
        priceLable.textAlignment = .left
        return priceLable
    }()
    
    lazy var buyCartBtn : UIButton = {
       let buyCartBtn = UIButton()
        buyCartBtn.addTarget(self, action: #selector(addToCart), for: .touchUpInside)
        buyCartBtn.setImage(UIImage.init(named: "ww_homes_cell_add_cart_btn_white_img"), for: .normal)
        return buyCartBtn
    }()
   
    @objc func addToCart(){
        
    }
}
