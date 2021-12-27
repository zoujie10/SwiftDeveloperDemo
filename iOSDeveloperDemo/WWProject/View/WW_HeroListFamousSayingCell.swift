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
        let backView = UIView()
        backView.backgroundColor = UIColor(r: 134, g: 25, b: 37)
        backView.layer.borderColor = UIColor(r:209, g:153, b:135, a:1).cgColor
        backView.layer.cornerRadius = 8
        self.contentView.addSubview(backView)
        backView.addSubview(self.famousSayingLabel)
        backView.addSubview(self.nameLabel)
        backView.addSubview(self.headImageView)
        
        backView.snp.makeConstraints { make in
            make.left.equalTo(self.contentView.snp_left).offset(12)
            make.right.equalTo(self.contentView.snp_right).offset(-12)
            make.top.equalTo(self.contentView.snp_top).offset(10)
            make.bottom.equalTo(self.contentView.snp_bottom).offset(-5)
        }
        
        famousSayingLabel.snp.makeConstraints { make in
            make.left.equalTo(backView).offset(12)
            make.top.equalTo(backView).offset(10)
            make.right.equalTo(backView).offset(-12)
            make.height.equalTo(30)
        }
        
        headImageView.snp.makeConstraints { make in
            make.width.height.equalTo(30)
            make.top.equalTo(famousSayingLabel.snp_bottom).offset(20)
            make.left.equalTo(backView).offset(12)
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
        self.selectionStyle = .none
        self.backgroundColor = .clear
        creatUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
