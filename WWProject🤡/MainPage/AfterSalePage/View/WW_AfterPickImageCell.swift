//
//  WW_AfterPickImageCell.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/5/7.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_AfterPickImageCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configUI(){
        contentView.addSubview(uploadImageView)
        uploadImageView.snp.makeConstraints { make in
            make.edges.equalTo(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        }
    }
    
    lazy var uploadImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Expression_15")
        return imageView
    }()
}
