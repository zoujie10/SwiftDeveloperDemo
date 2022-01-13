//
//  WW_NoDataView.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/1/13.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_NoDataView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configUI(){
        self.addSubview(self.imageView)
        self.addSubview(self.alertLabel)
        
        self.imageView.snp.makeConstraints { make in
            make.center.equalTo(self)
        }
        
        self.alertLabel.snp.makeConstraints { make in
            make.top.equalTo(self.imageView.snp_bottom).offset(15)
            make.centerX.equalTo(self.imageView)
        }
    }
    
    lazy var imageView : UIImageView = {
        let Iv = UIImageView()
        Iv.image = UIImage(named: "ww_ceos_order_list_empty_default_img")
        Iv.contentMode = .scaleAspectFit
        return Iv
    }()
    
    lazy var alertLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor.lightGray;
        label.text = "没有搜索的内容喔~"
        return label
    }()
}
