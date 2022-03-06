//
//  WW_CustomerChooseHeaderView.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/2/24.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_CustomerChooseHeaderView: UICollectionReusableView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        creatUI()
    }
    
    func creatUI(){
        self.addSubview(sectionTitleLabel)
        self.addSubview(jumpGradeBtn)
            
        sectionTitleLabel.snp.makeConstraints { make in
            make.left.equalTo(self).offset(10)
            make.top.bottom.equalTo(self)
        }
        
        jumpGradeBtn.snp.makeConstraints { make in
            make.left.equalTo(sectionTitleLabel.snp_right).offset(5)
            make.height.width.equalTo(14)
            make.centerY.equalTo(sectionTitleLabel)
        }
    }
    
    @objc func jump(){
        
    }
    
    lazy var sectionTitleLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.backgroundColor = .white
        label.textColor = .black
        return label;
    }()
    
    lazy var jumpGradeBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "ww_customer_grade_question_mark"), for: .normal)
        btn.addTarget(self, action: #selector(jump), for: .touchUpInside)
        btn.isHidden = true
        return btn
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
