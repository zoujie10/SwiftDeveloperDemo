//
//  WW_OrderListCell.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/12/13.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class WW_OrderListCell: UITableViewCell {

    func creatUI(){
        contentView.addSubview(self.timeLineLabel)
        let bgview = UIView()
        bgview.backgroundColor = .white
        contentView.addSubview(bgview)
        
        bgview.addSubview(self.replyStateLabel)
        bgview.addSubview(self.reportPriceLabel)
       
        bgview.addSubview(self.listImageView)
        bgview.addSubview(self.productTitleLabel)
        bgview.addSubview(self.productSpecLabel)
        bgview.addSubview(self.productPriceLabel)
        
        bgview.addSubview(self.replyTitleLabel)
        bgview.addSubview(self.replyContextLabel)
        
        self.timeLineLabel.snp.makeConstraints { make in
            make.top.right.equalTo(self.contentView)
            make.left.equalTo(self.contentView).offset(14)
            make.height.equalTo(38)
        }
        bgview.snp.makeConstraints { make in
            make.top.equalTo(self.timeLineLabel.snp_bottom)
            make.left.right.bottom.equalTo(self.contentView)
        }
        self.replyStateLabel.snp.makeConstraints { make in
            make.top.equalTo(bgview.snp_top).offset(12)
            make.left.equalTo(bgview.snp_left).offset(14)
            make.height.equalTo(18)
        }
        self.reportPriceLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self.replyStateLabel)
            make.right.equalTo(bgview).offset(-12)
        }
        self.listImageView.snp.makeConstraints { make in
            make.top.equalTo(self.replyStateLabel.snp_bottom).offset(20)
            make.left.equalTo(self.contentView.snp_left).offset(14)
            make.width.height.equalTo(85)
        }
        self.productTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.listImageView.snp_top)
            make.left.equalTo(self.listImageView.snp_right).offset(10)
            make.right.equalTo(bgview.snp_right).offset(-14)
        }
        self.productSpecLabel.snp.makeConstraints { make in
            make.top.equalTo(self.productTitleLabel.snp_baseline).offset(5)
            make.left.equalTo(self.productTitleLabel)
            make.right.equalTo(self.productTitleLabel).offset(-15)
        }
        self.productPriceLabel.snp.makeConstraints { make in
            make.left.equalTo(self.productTitleLabel)
            make.top.equalTo(self.productSpecLabel.snp_bottom).offset(18)
        }
        self.replyContextLabel.snp.makeConstraints { make in
            make.left.equalTo(self.replyTitleLabel.snp_right).offset(10)
            make.right.equalTo(bgview.snp_right).offset(-10)
            make.bottom.equalTo(bgview.snp_bottom).offset(-20)
        }
        self.replyTitleLabel.snp.makeConstraints { make in
            make.left.equalTo(self.contentView).offset(14)
            make.top.equalTo(self.replyContextLabel.snp_top)
            make.width.equalTo(30)
            make.height.equalTo(18)
        }
        
    }
    
    lazy var timeLineLabel = UILabel().then { make in
        make.textColor = UIColor.black
        make.text = "2021-12-02 10:05"
        make.textAlignment = .left
    }
    lazy var replyStateLabel = UILabel().then { make in
        make.textColor = UIColor(red: 22/255, green: 25/255, blue: 23/255, alpha: 1)
        make.text = "已回复"
        make.textAlignment = .left
    }
    lazy var reportPriceLabel = UILabel().then { make in
        make.textColor = UIColor(red: 138/255, green: 143/255, blue: 150/255, alpha: 1)
        make.text = "11.11"
        make.textAlignment = .right
    }
    lazy var listImageView = UIImageView().then { make in
        make.layer.cornerRadius = 4
        make.contentMode = .scaleAspectFit
    }
    
    lazy var productTitleLabel = UILabel().then { make in
        make.textColor = UIColor(red: 22/255, green: 25/255, blue: 30/255, alpha: 1)
        make.text = "旺仔牛奶"
        make.textAlignment = .left
    }
    
    lazy var productSpecLabel = UILabel().then { make in
        make.textColor = UIColor(red: 138/255, green: 143/255, blue: 150/255, alpha: 1)
        make.text = "规格"
        make.textAlignment = .left
    }
    
    lazy var productPriceLabel = UILabel().then { make in
        make.textColor = .black
        make.text = "12.12"
        make.textAlignment = .left
    }
    
    lazy var replyTitleLabel = UILabel().then { make in
        make.textColor = UIColor(r: 241, g: 37, b: 37)
        make.text = "回复"
        make.textAlignment = .left
        make.font = UIFont.boldSystemFont(ofSize: 13)
    }
    
    lazy var replyContextLabel = UILabel().then { make in

        make.textColor = .black
        make.text = " "
        make.textAlignment = .left
        make.font = UIFont.boldSystemFont(ofSize: 13)
        make.numberOfLines = 0
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.isUserInteractionEnabled = true
        self.selectionStyle = .default
        self.backgroundColor = UIColor(red: 243/255, green: 245/255, blue: 248/255, alpha: 1)
        creatUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
