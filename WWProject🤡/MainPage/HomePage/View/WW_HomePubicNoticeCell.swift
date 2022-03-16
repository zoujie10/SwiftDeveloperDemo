//
//  WW_HomePubicNoticeCell.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/1/22.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_HomePubicNoticeCell: WW_HomeBaseCell {
    
    override func initContentView() {
        super.initContentView()
        self.contentView.backgroundColor = .white
        self.contentView.addSubview(self.mainBgView)
        self.mainBgView.addSubview(self.oneImageView)
        
        self.mainBgView.snp.makeConstraints { make in
            make.edges.equalTo(UIEdgeInsets.init(top: 7, left: 15, bottom: 4, right: 15))
        }
        self.oneImageView.snp.makeConstraints { make in
            make.edges.equalTo(self.mainBgView)
        }
        
        self.oneImageView.kf.indicatorType = .activity
    }
    
    override func updateData(itemData: WW_HomeItemModel) {
        if itemData.configureAttribute?.count ?? 0 > 0 {
            let model = itemData.configureAttribute?.first
            self.oneImageView.kf.setImage(with: URL.init(string:model?.pictureURL ?? " "))
        }
    }
    
    @objc func tapGesture(tap : UITapGestureRecognizer){
            print("点击公告------😝啦啦啦")
    }
    
    lazy var oneImageView : UIImageView = {
        let iV = UIImageView()
        iV.layer.masksToBounds = true
        iV.layer.cornerRadius = 4
        iV.backgroundColor = .clear
        iV.isUserInteractionEnabled = true
        iV.contentMode = .scaleAspectFill
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(tapGesture))
        iV.addGestureRecognizer(tap)
        return iV
    }()
    
    lazy var mainBgView : UIView = {
        let view = UIView.init(frame: .zero)
        view.backgroundColor = self.contentView.backgroundColor
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 4.0
        self.contentView.addSubview(view)
        return view
    }()
}
