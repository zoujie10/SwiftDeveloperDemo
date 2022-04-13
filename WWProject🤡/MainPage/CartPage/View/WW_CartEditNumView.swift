//
//  WW_CartEditNumView.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/4/10.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit
protocol WWCartEditNumViewDelegate: NSObjectProtocol {
    func cartEditNumView(_ editNumView: WW_CartEditNumView?, addButtonClick sender: UIButton?)
    func cartEditNumView(_ editNumView: WW_CartEditNumView?, minusButtonClick sender: UIButton?)
    func cartEditNumView(_ editNumView: WW_CartEditNumView?, textFieldTextChange sender: UITextField?)
    func cartEditNumView(_ editNumView: WW_CartEditNumView?, textFieldDidEndEdit sender: UITextField?)}


class WW_CartEditNumView: UIView,UITextFieldDelegate {

    weak var delegate: WWCartEditNumViewDelegate?
    /// 数字
    var number: String?
    /// 增加按钮状态
    var addButtonEnable = false
    /// 减少按钮状体
    var minusButtonEnable = false
    /// 减少按钮即将不可用
    var minusButtonWillDisAble = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        creatUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func creatUI(){
        self.addSubview(self.minusBtn)
        self.addSubview(self.addBtn)
        self.addSubview(self.textField)
        self.minusBtn.snp.makeConstraints { make in
            make.left.top.bottom.equalTo(self)
            make.width.equalTo(self.minusBtn.snp_height)
        }
        self.addBtn.snp.makeConstraints { make in
            make.right.equalTo(self)
            make.top.bottom.width.equalTo(self.minusBtn)
        }
        self.textField.snp.makeConstraints { make in
            make.top.bottom.equalTo(self)
            make.left.equalTo(self.minusBtn.snp_right)
            make.right.equalTo(self.addBtn.snp_left)
        }
    }
    
    
    //MARK: Event method
    @objc func buttonClick(_ sender: UIButton?) {
        if delegate != nil{
            return
        }
        if sender == addBtn {
            if delegate!.responds(to: Selector(("cartEditNumView:AddButtonClick:"))) {
                delegate!.cartEditNumView(self, addButtonClick: sender)
            }
        } else if sender == minusBtn {
            if delegate!.responds(to: Selector(("cartEditNumView:MinusButtonClick:"))) {
                delegate!.cartEditNumView(self, minusButtonClick: sender)
            }
        }
    }
    func textFieldEditChange(_ textField: UITextField?) {
        if (delegate != nil) && delegate!.responds(to: Selector(("cartEditNumView:textFieldTextChange:"))) {
            delegate!.cartEditNumView(self, textFieldTextChange: textField)
        }
    }
    //MARK: Delegate
    func textFieldDidEndEditing(_ textField: UITextField) {
        if (delegate != nil) && delegate!.responds(to: Selector(("cartEditNumView:textFieldDidEndEdit:"))) {
            delegate!.cartEditNumView(self, textFieldDidEndEdit: textField)
        }
    }
    //MARK: lazy load
    lazy var addBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        btn.setImage(UIImage(named: "ww_shoping_carts_add_btn_img"), for: .normal)
        btn.setImage(UIImage(named: "ww_shoping_carts_add_none_btn_img"), for: .disabled)
        btn.layer.cornerRadius = 2
        btn.layer.borderWidth = 0.5
        btn.layer.borderColor = UIColor(r:242, g:242, b:242).cgColor
        return btn
    }()
    
    lazy var minusBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        btn.setImage(UIImage(named: "ww_shoping_carts_minus_btn_img"), for: .normal)
        btn.setImage(UIImage(named: "ww_shoping_carts_minus_none_btn_img"), for: .disabled)
        btn.layer.cornerRadius = 2
        btn.layer.borderWidth = 0.5
        btn.layer.borderColor = UIColor(r:242, g:242, b:242).cgColor
        return btn
    }()
    
    lazy var textField : UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor(r: 255, g: 255, b: 255)
        textField.textAlignment = .center
        textField.font = UIFont.boldSystemFont(ofSize: 14)
        textField.textColor = UIColor(r: 71, g: 71, b: 7)
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor(r: 242, g: 242, b: 242).cgColor
        textField.delegate = self
        textField.keyboardType = .numberPad
        textField.addTarget(self, action: Selector(("textFieldEditChange:")), for: .editingChanged)
        return textField
    }()
}
