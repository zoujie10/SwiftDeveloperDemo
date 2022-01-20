//
//  WW_HomeBannerCell.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/1/19.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit
class WW_HomeBannerSubCell : UICollectionViewCell{
    let urlString : String = ""
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpSubviews()
    }
    func setUpSubviews(){
        
        
    }
    
    
    lazy var imageView : UIImageView = {
        let iV = UIImageView()
        return iV
    }()
    
    lazy var defaultImageView : UIImageView = {
        let iV = UIImageView()
        iV.image = UIImage(named: "")
        return iV
    }()
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class WW_HomeBannerCell: WW_HomeBaseCell {
    
}
