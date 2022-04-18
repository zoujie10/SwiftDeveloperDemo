//
//  WW_CartBottomDeleteView.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/4/12.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_CartBottomDeleteView: UIView {
    typealias deleteBlock = () -> Void
    var delete_Block : deleteBlock?
    
    typealias selectBlock = (_ isSelect:Bool) -> Void
    var select_Block : selectBlock?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        creatUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func creatUI(){
        self.addSubview(deleteBtn)
        deleteBtn.snp.makeConstraints { make in
            make.top.right.bottom.equalTo(self)
            make.width.equalTo(85)
        }
        self.addSubview(selectBtn)
        selectBtn.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.left.equalTo(self).offset(25)
        }
        self.addSubview(selectLabel)
        selectLabel.snp.makeConstraints { make in
            make.centerY.equalTo(selectBtn)
            make.width.equalTo(35)
            make.left.equalTo(selectBtn.snp_right)
        }
    }
    
    @objc func deleteBtnMethod(){
        if self.delete_Block != nil{
            delete_Block!()
        }
    }
    
    @objc func selectMethod(sender:UIButton){
        sender.isSelected = !sender.isSelected
        deleteBtn.backgroundColor = sender.isSelected ? UIColor(r: 252, g: 85, b: 108):UIColor(r: 220, g: 222, b: 224)
        self.select_Block!(sender.isSelected)
    }
    lazy var deleteBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("删除", for: .normal)
        
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btn.setTitleColor(UIColor.white, for: .normal)
//        btn.backgroundColor = UIColor(r: 252, g: 85, b: 108)//(220, 222, 224, 1)
        btn.backgroundColor = UIColor(r: 220, g: 222, b: 224)
        btn.addTarget(self, action: #selector(deleteBtnMethod), for: .touchUpInside)
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
