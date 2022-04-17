//
//  WW_CartBottomCalculateView.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/4/12.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_CartBottomCalculateView: UIView {

    
    typealias calculateBlock = () -> Void
    var calculate_Block : calculateBlock?
    
    typealias selectBlock = () -> Void
    var select_Block : selectBlock?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        creatUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func creatUI(){
        self.addSubview(calculateBtn)
        calculateBtn.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.right.equalTo(self).offset(-15)
            make.width.equalTo(95)
            make.height.equalTo(45)
        }
        self.addSubview(calculateLabel)
        calculateLabel.snp.makeConstraints { make in
            make.centerY.equalTo(calculateBtn)
            make.right.equalTo(calculateBtn.snp_left).offset(-10)
        }
        
        self.addSubview(selectBtn)
        selectBtn.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.left.equalTo(self).offset(24)
        }
        self.addSubview(selectLabel)
        selectLabel.snp.makeConstraints { make in
            make.centerY.equalTo(selectBtn)
            make.width.equalTo(35)
            make.left.equalTo(selectBtn.snp_right)
        }
        configCalculateContext(amount:"nodata")
    }
    
    @objc func calculateMethod(){
        self.calculate_Block!()
    }
    @objc func selectMethod(){
        self.select_Block!()
    }
   
    func configCalculateContext(amount:String){
        let att = NSMutableAttributedString.init(string: "(不含运费)")
        let calculateTitle = NSAttributedString.init(string: "合计:", attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 14),NSAttributedStringKey.foregroundColor : UIColor.black])
        let amount = NSAttributedString.init(string: "￥17.41", attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 14),NSAttributedStringKey.foregroundColor : UIColor(r: 252, g: 85, b: 108)])
        att.append(calculateTitle)
        att.append(amount)
        self.calculateLabel.attributedText = att
    }//attributes
   
    lazy var calculateLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .white
        
        label.textColor = UIColor(r: 37, g: 37, b: 40)
        label.text = "(不含运费)合计：￥18.41"
        label.font = UIFont.boldSystemFont(ofSize: 12)
    
        return label;
    }()
    lazy var calculateBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("去结算(0)", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor(r: 252, g: 85, b: 108)//(220, 222, 224, 1),(r: 252, g: 85, b: 108)
        btn.addTarget(self, action: #selector(calculateMethod), for: .touchUpInside)
        btn.layer.cornerRadius = 18
        return btn
    }()
    
    lazy var selectBtn : UIButton = {
        let btn = UIButton()
        btn.addTarget(self, action: #selector(selectMethod), for: .touchUpInside)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.setImage(UIImage(named: "ww_shoping_carts_unselect_btn_img_dark"), for: .normal)
        btn.setImage(UIImage(named: "ww_shoping_carts_select_btn_img_dark"), for: .selected)
        btn.imageEdgeInsets = UIEdgeInsets(top: 0.0, left: -10, bottom: 0.0, right: 0.0)
        return btn
    }()
    
    lazy var selectLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .white
        
        label.textColor = UIColor(r: 37, g: 37, b: 40)
        label.text = "全选"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label;
    }()
}
