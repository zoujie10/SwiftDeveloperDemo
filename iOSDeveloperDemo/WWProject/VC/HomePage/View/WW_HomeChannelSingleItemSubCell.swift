//
//  WW_HomeChannelSingleItemSubCell.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/1/24.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_HomeChannelSingleItemSubCell: UICollectionViewCell {
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setSubView(){
        self.contentView.addSubview(self.bgView)
        self.bgView.addSubview(self.imageView)
        self.bgView.addSubview(self.label)
        
        self.bgView.snp.makeConstraints { make in
            make.left.right.top.equalTo(self.contentView)
            make.height.equalTo(self.contentView).multipliedBy(0.5)
        }
        self.imageView.snp.makeConstraints { make in
            make.top.centerX.equalTo(self.bgView)
            make.width.height.equalTo(50)
        }
        self.label.snp.makeConstraints { make in
            make.top.equalTo(self.imageView.snp_bottom)
            make.left.right.equalTo(self.imageView)
        }
    }
    lazy var bgView : UIView = {
        let v = UIView()
        return v
    }()
    
    lazy var imageView : UIImageView = {
        let iV = UIImageView()
        iV.backgroundColor = .white
        return iV
    }()
    
    lazy var label : UILabel = {
        let l = UILabel()
        l.font = UIFont.boldSystemFont(ofSize: 12)
        l.textColor = UIColor(r: 133, g: 134, b: 138)
        l.textAlignment = .center
        return l
    }()
}
