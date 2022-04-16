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
        self.contentView.addSubview(self.backgroudView)
        self.contentView.addSubview(self.iconImageView)
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.desLabel)
        self.contentView.addSubview(self.priceLable)
       
        backgroudView.snp.makeConstraints { make in
            make.edges.equalTo(UIEdgeInsets(top: -5, left: 12, bottom: 0, right: 12))//子视图超出遮盖圆角
        }
        
        self.iconImageView.snp.makeConstraints {
            $0.top.left.equalTo(self.contentView).offset(15)
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
    
    func configData(model : WW_CartItem){
        self.iconImageView.kf.setImage(with: URL.init(string: (model.wpProductTemplate?.list_images!)!))
        self.iconImageView.kf.indicatorType = .activity
        self.titleLabel.text = model.wpProductTemplate?.name
        
    }
    
    
    lazy var backgroudView : UIView = {
        let backgroudView = UIView()
        backgroudView.backgroundColor = .white
        backgroudView.layer.shadowColor = UIColor(r: 0, g: 0, b: 0, a: 0.2).cgColor
        backgroudView.layer.shadowOffset = CGSize(width: 0, height: 3)
        backgroudView.layer.shadowOpacity = 1
        backgroudView.layer.shadowRadius = 5
        backgroudView.layer.cornerRadius = 7
        return backgroudView
    }()
    
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
