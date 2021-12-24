//
//  WW_HeroListFamousSayingCell.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/12/24.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class WW_HeroListFamousSayingCell: UITableViewCell {
    func creatUI(){
        self.contentView.addSubview(self.famousSayingLabel)
        self.contentView.addSubview(self.nameLabel)
        self.contentView.addSubview(self.headImageView)
        
        famousSayingLabel.snp.makeConstraints { make in
            make.left.equalTo(self.contentView).offset(12)
            make.top.equalTo(self.contentView).offset(10)
            make.right.equalTo(self.contentView).offset(-12)
            make.height.equalTo(30)
        }
        
        headImageView.snp.makeConstraints { make in
            make.width.height.equalTo(30)
            make.top.equalTo(famousSayingLabel.snp_bottom).offset(20)
            make.left.equalTo(self.contentView).offset(12)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(headImageView.snp_right).offset(15)
            make.centerY.equalTo(headImageView)
        }
    }
    
    
    lazy var nameLabel : UILabel = {
        let Label = UILabel()
        Label.textAlignment = .left
        Label.backgroundColor = .clear
        Label.textColor = .white
        return Label;
    }()
    
    lazy var famousSayingLabel : UILabel = {
        let Label = UILabel()
        Label.textAlignment = .left
        Label.backgroundColor = .clear
        Label.textColor = .white
        return Label;
    }()

    lazy var headImageView : UIImageView = {
        let headImageView = UIImageView()
        headImageView.image = UIImage(named: "Expression_15")
        return headImageView
    }()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.isUserInteractionEnabled = true
        self.selectionStyle = .default
        self.backgroundColor = UIColor(r: 134, g: 25, b: 37)
        creatUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
