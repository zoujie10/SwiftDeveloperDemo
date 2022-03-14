//
//  WW_CustomerChooseTitleView.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/2/24.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_CustomerChooseTitleView: UIView {

    
    typealias clickResetBlock = () -> Void
    var clickReset_block : clickResetBlock?
    
    typealias selectTypeBlock = (Int) -> Void
    var selectType_block : selectTypeBlock?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        creatUI()
    }
    func creatUI(){
        self.addSubview(titleLabel)
        self.addSubview(resetBtn)
        self.addSubview(filtBtn)
        self.addSubview(sorttBtn)
        self.addSubview(LineView)
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self);
            make.top.equalTo(self).offset(60);
            make.width.equalTo(100);
        }
     
        resetBtn.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel)
            make.right.equalTo(self).offset(-20)
            make.height.equalTo(30)
        }
        
        filtBtn.snp.makeConstraints { make in
            make.right.equalTo(self.snp_centerX).offset(-50)
            make.top.equalTo(titleLabel.snp_bottom).offset(50)
        }
        
        sorttBtn.snp.makeConstraints { make in
            make.left.equalTo(self.snp_centerX).offset(50)
            make.top.equalTo(titleLabel.snp_bottom).offset(50)
        }
        
        LineView.snp.makeConstraints { make in
            make.top.equalTo(filtBtn.snp_bottom).offset(15)
            make.centerX.equalTo(filtBtn.snp_centerX)
            make.width.equalTo(filtBtn.sd_width)
        }
    }
    
    @objc func reset(){
        if(self.clickReset_block != nil){
            self.clickReset_block!()
        }
    }
    
    @objc func changeSelect(sender : UIButton){
        if(self.selectType_block != nil){
            var index = 0
            if(sender.tag == 10001){
                index = 1
            }else{
                index = 0
            }
            self.selectType_block!(index)
        }
    }
    
    lazy var resetBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle(" 重置", for: .normal)
        btn.setTitleColor(UIColor(r: 252, g: 85, b: 108, a: 1), for: .normal)
        btn.setImage(UIImage(named: "ww_customer_refresh_btn"), for: .normal)
        btn.addTarget(self, action: #selector(reset), for: .touchUpInside)
    
        return btn
    }()
    
    lazy var sorttBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("排序", for: .normal)
        btn.setTitleColor(.lightGray, for: .normal)
        btn.setTitleColor(.black, for: .selected)
        btn.addTarget(self, action: #selector(changeSelect), for: .touchUpInside)
        btn.tag = 10001
        return btn
    }()
    
    lazy var filtBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("筛选", for: .normal)
        btn.setTitleColor(.black, for: .selected)
        btn.setTitleColor(.lightGray, for: .normal)
        btn.addTarget(self, action: #selector(changeSelect), for: .touchUpInside)
        btn.tag = 10000
        return btn
    }()
    
    lazy var LineView : UIView = {
        let line = UIView()
        line.backgroundColor = .red
        line.layer.cornerRadius = 8
        return line;
    }()
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .white
        label.textColor = .black
        label.text = "客户选择"
        label.font = .boldSystemFont(ofSize: 20)
        return label;
    }()

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
