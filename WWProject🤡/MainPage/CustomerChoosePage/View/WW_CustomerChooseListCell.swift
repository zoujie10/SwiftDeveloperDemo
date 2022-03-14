//
//  WW_CustomerChooseListCell.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/2/24.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_CustomerChooseListCell: UICollectionViewCell {

   
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 4
        creatUI()
    }
    
    func creatUI(){
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
    
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.textColor = UIColor(r: 128, g: 132, b: 139, a: 1)
        label.font = .boldSystemFont(ofSize: 12)
        return label;
    }()
    
    func configSelect(isSelect: Bool){
        if (isSelect) {
            self.backgroundColor = UIColor.white
            self.layer.borderWidth = 1.5
            self.layer.borderColor = UIColor(r: 252, g: 85, b: 108).cgColor
            titleLabel.textColor = UIColor(r: 252, g: 85, b: 108)
        }else{
            self.backgroundColor = UIColor(r: 252, g: 85, b: 108, a: 0.1)
            self.layer.borderWidth = 0
            titleLabel.textColor = .black
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class WW_CustomerChooseListInputAmountAreaCell : UICollectionViewCell,UITextFieldDelegate {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        creatUI()
    }
    
    func creatUI(){
        contentView.addSubview(lowTextField)
        contentView.addSubview(highTextField)
        let line = UIView()
        line.backgroundColor = UIColor.lightGray
        contentView.addSubview(line)
        
        lowTextField.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.height.equalTo(30)
            make.width.equalTo(120)
            make.left.equalTo(30)
        }
       
        line.snp.makeConstraints { make in
            make.centerY.equalTo(lowTextField)
            make.width.equalTo(10)
            make.height.equalTo(2)
            make.left.equalTo(lowTextField.snp_right).offset(5)
        }
        highTextField.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.height.equalTo(30)
            make.width.equalTo(120)
            make.left.equalTo(line.snp_right).offset(5)
        }
    }
    
    @objc func textFieldEditChange(textField:UITextField){
        
    }
    
    lazy var lowTextField : UITextField = {
        let field = UITextField()
        field.placeholder = "最低金额"
        field.layer.cornerRadius = 2
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.addTarget(self, action: #selector(textFieldEditChange), for: .editingChanged)
        
        let leftImgView = UIImageView.init(frame: CGRect(x: 10, y: 5, width: 12, height: 12))
        leftImgView.image = UIImage(named: "wwbd_custormerDetail_average_price_icon")
        leftImgView.contentMode = .center
        let leftPaddingView = UIView.init(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        leftPaddingView.addSubview(leftImgView)
        field.leftView = leftPaddingView
        field.leftViewMode = .always
        return field
    }()
    lazy var highTextField : UITextField = {
        let field = UITextField()
        field.placeholder = "最高金额"
        field.layer.cornerRadius = 2
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor

        let leftImgView = UIImageView.init(frame: CGRect(x: 10, y: 5, width: 12, height: 12))
        leftImgView.image = UIImage(named: "wwbd_custormerDetail_average_price_icon")
        leftImgView.contentMode = .center
        let leftPaddingView = UIView.init(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        leftPaddingView.addSubview(leftImgView)
        field.leftView = leftPaddingView
        field.leftViewMode = .always
        return field
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
  
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
