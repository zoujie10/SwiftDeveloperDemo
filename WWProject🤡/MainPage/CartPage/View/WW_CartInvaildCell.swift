//
//  WW_CartInvaildCell.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/4/8.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_CartInvaildCell: UITableViewCell {
   

//    /// 背景view
//    var backgroudView: UIView?
//    /// 商品图片
//    var productImage: UIImageView?
//    /// 商品名称
//    var productTitleLabel: UILabel?
//    /// 商品规格
//    var specLabel: UILabel?
//    /// 商品生产日期
//    var dateLabel: UILabel?
//    /// 商品折扣
//    var auntLable: UILabel?
//    /// 商品价格
//    var priceLabel: UILabel?
//    /// 分割线
//    var lineView: UIView?
//    /// 提示失效商品
//    var tipLoseEfficacyView: UIView?
//    /// 提示失效商品
//    var tipLoseEfficacy: UILabel?

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
            contentView.backgroundColor = UIColor(r: 247, g: 247, b: 247)
            creatUI()
    }
    
    func creatUI(){
        self.contentView.addSubview(self.iconImageView)
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.desLabel)
        self.contentView.addSubview(self.priceLable)
       
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
