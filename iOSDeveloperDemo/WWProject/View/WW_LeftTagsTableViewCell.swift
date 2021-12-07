//
//  WW_LeftTagsTableViewCell.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/12/7.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class WW_LeftTagsTableViewCell: UITableViewCell {

    
    func creatUI(){
        self.contentView.addSubview(self.titleLabel)
        
        self.titleLabel.snp.makeConstraints { make in
            make.center.equalTo(self.contentView)
        }
        
        self.contentView.addSubview(verticalLine)
        verticalLine.snp.makeConstraints { make in
            make.left.equalTo(self.contentView)
            make.top.equalTo(self.contentView).offset(10)
            make.bottom.equalTo(self.contentView).offset(-10)
            make.width.equalTo(5)
        }
    }
    
    lazy var titleLabel : UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "商品名"
        titleLabel.textColor = UIColor.black
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 2
        
        return titleLabel
    }()
    
    lazy var verticalLine : UIView = {
        let verticalLine = UIView()
        verticalLine.backgroundColor = UIColor(red: 252/255, green: 67/255, blue: 85/255, alpha: 1)
        return verticalLine
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.isUserInteractionEnabled = true
        self.selectionStyle = .default
        creatUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
