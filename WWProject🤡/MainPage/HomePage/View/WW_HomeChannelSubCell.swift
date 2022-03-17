//
//  WW_HomeChannelSubCell.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/1/24.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit
/**
 ----
| 口 |
| 口 |
 _____ 上下两个为1个item  -- two Item cell
 */
class WW_HomeChannelSubCell: UICollectionViewCell {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setSubView(){
        self.contentView.addSubview(self.upBgView)
        self.upBgView.addSubview(self.upImageView)
        self.upBgView.addSubview(self.upLabel)
        self.contentView.addSubview(self.downBgView)
        self.downBgView.addSubview(self.downImageView)
        self.downBgView.addSubview(self.downLabel)
        
        self.upBgView.snp.makeConstraints { make in
            make.left.right.top.equalTo(self.contentView)
            make.height.equalTo(self.contentView).multipliedBy(0.5)
        }
        self.upImageView.snp.makeConstraints { make in
            make.top.centerX.equalTo(self.upBgView)
            make.width.height.equalTo(50)
        }
        self.upLabel.snp.makeConstraints { make in
            make.top.equalTo(self.upImageView.snp_bottom)
            make.left.right.equalTo(self.upImageView)
        }
        
        self.downBgView.snp.makeConstraints { make in
            make.left.bottom.right.equalTo(self.contentView)
            make.top.equalTo(self.upBgView.snp_bottom)
        }
        self.downImageView.snp.makeConstraints { make in
            make.top.equalTo(self.downBgView).offset(3)
            make.centerX.equalTo(self.downBgView)
            make.width.height.equalTo(50)
        }
        self.downLabel.snp.makeConstraints { make in
            make.top.equalTo(self.downImageView.snp_bottom)
            make.left.right.equalTo(self.downBgView)
        }
        
//        self.upImageView.kf.setImage(with: URL.init(string: "https://hotkidceo-1251330842.file.myqcloud.com/2021121709491500052.png"))
//        self.upImageView.kf.indicatorType = .activity
//        
//        self.downImageView.kf.setImage(with: URL.init(string: "https://hotkidceo-1251330842.file.myqcloud.com/2021121709492300053.png"))
//        self.downImageView.kf.indicatorType = .activity
    }
    
    lazy var upBgView : UIView = {
        let v = UIView()
        return v
    }()
    
    lazy var upImageView : UIImageView = {
        let iV = UIImageView()
        iV.layer.cornerRadius = 8
        return iV
    }()
    
    lazy var upLabel : UILabel = {
        let l = UILabel()
        l.font = UIFont.boldSystemFont(ofSize: 12)
        l.textColor = UIColor(r: 133, g: 134, b: 138)
        l.textAlignment = .center
        l.text = "标签"
        return l
    }()
    
    lazy var downBgView : UIView = {
        let v = UIView()
        return v
    }()
    lazy var downImageView : UIImageView = {
        let iV = UIImageView()
        iV.layer.cornerRadius = 8
        return iV
    }()
    lazy var downLabel : UILabel = {
        let l = UILabel()
        l.font = UIFont.boldSystemFont(ofSize: 12)
        l.textColor = UIColor(r: 133, g: 134, b: 138)
        l.textAlignment = .center
        l.text = "分类"
        return l
    }()
}
