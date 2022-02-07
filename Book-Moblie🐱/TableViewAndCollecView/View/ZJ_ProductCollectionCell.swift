//
//  ZJ_ProductCollectionCell.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/11/1.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class ZJ_ProductCollectionCell: UICollectionViewCell {
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
        self.addSubview(self.productTitleLabel)
        
        self.imageIconView.snp.makeConstraints {
            $0.centerX.equalTo(self)
            $0.top.equalTo(self).offset(10)
            $0.width.height.equalTo(80)
        }
        
        self.productTitleLabel.snp.makeConstraints {
            $0.left.right.bottom.equalTo(self)
            $0.top.equalTo(self.imageIconView.snp_bottom)
        }
    }
    
    lazy var imageIconView : UIImageView = {
        let imageIconView = UIImageView()
        imageIconView.layer.opacity = 0.5
        imageIconView.tag = 1
        return imageIconView
    }()
    
    lazy var productTitleLabel : UILabel = {
        let productTitleLabel = UILabel()
        productTitleLabel.numberOfLines = 2
        productTitleLabel.textColor = UIColor.black
        productTitleLabel.textAlignment = .center
        return productTitleLabel
    }()
}
