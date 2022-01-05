//
//  WW_SearchHotWordsCollectionCell.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/1/1.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_SearchHotWordsCollectionCell: UICollectionViewCell {
    
    typealias clickIndexDeleteBlock = () -> Void
    var clickBlock : clickIndexDeleteBlock?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        creatUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func creatUI(){
        self.contentView.layer.cornerRadius = 12
        self.contentView.addSubview(self.nameLabel)
        self.contentView.addSubview(self.deleteBtn)
        
        self.nameLabel.snp.makeConstraints { make in
            make.top.equalTo(self.contentView)
            make.left.equalTo(self.contentView).offset(10)
            make.height.equalTo(30)
            make.right.equalTo(self.contentView).offset(-10)
        }
        self.deleteBtn.snp.makeConstraints { make in
            make.centerY.equalTo(self.nameLabel)
            make.width.height.equalTo(9)
            make.right.equalTo(self.contentView).offset(-5)
        }
    }
    
    var nameLabel : UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 14)
        return label
    }()
    
    var deleteBtn : UIButton = {
        let btn = UIButton()
        btn.isHidden = true
        btn.setImage(UIImage(named: "ww_search_clear_btn_img"), for: .normal)
        btn.addTarget(self, action: #selector(deleteItems), for: .touchUpInside)
        return btn
    }()
    
    @objc func deleteItems(){
        if(self.clickBlock != nil){
            self.clickBlock!()
        }
    }
}
