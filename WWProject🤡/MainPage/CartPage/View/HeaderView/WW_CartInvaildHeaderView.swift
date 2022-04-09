//
//  WW_CartInvaildHeaderView.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/4/9.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_CartInvaildHeaderView: UITableViewHeaderFooterView {

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor(r: 247, g: 247, b: 247)
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func creatUI() {
        self.invaildTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.contentView).offset(10)
            make.left.equalTo(self.contentView).offset(23)
        }
        
        self.clearButton.snp.makeConstraints { make in
            make.centerY.equalTo(self.invaildTitleLabel)
            make.right.equalTo(self.contentView).offset(-12)
        }
    }
    @objc func clickBtnMethod(){
        
    }
    
    
    lazy var invaildTitleLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .white
        label.textColor = UIColor(r: 37, g: 37, b: 40)
        label.text = "失效商品"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label;
    }()

    lazy var clearButton : UIButton = {
        let btn = UIButton()
        btn.setTitle(" 清空失效商品 ", for: .normal)
        btn.setTitleColor(UIColor(r: 244, g: 46, b: 80), for: .normal)
        btn.addTarget(self, action: #selector(clickBtnMethod), for: .touchUpInside)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        return btn
    }()
}
