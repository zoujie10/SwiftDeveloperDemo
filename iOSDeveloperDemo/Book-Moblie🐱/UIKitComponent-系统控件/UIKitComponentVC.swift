//
//  UIKitComponentVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/10/11.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class UIKitComponentVC: UIViewController, UITextFieldDelegate {
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        creatUI()
    }
    
    func creatUI(){
        self.view.addSubview(self.btn)
        self.view.addSubview(self.label)
//        self.view.addSubview(self.textField)
        self.view.addSubview(self.textFieldBackView)
        
        self.btn.snp.makeConstraints { make in
            make.left.top.equalTo(self.view).offset(100)
            make.width.equalTo(100)
        }
        
        self.label.snp.makeConstraints { make in
            make.left.equalTo(self.btn)
            make.top.equalTo(self.btn.snp_bottom).offset(50)
            make.width.equalTo(100)
        }
        
        self.textFieldBackView.snp.makeConstraints { make in
            make.left.equalTo(self.btn)
            make.top.equalTo(self.label.snp_bottom).offset(50)
            make.width.equalTo(100)
        }
    }
    
    //MARK: Button
    lazy var btn : UIButton = {
        let btn = UIButton()
        btn.setTitle("按钮", for: .normal)
        btn.setTitleColor(.red, for: .normal)
        btn.addTarget(self, action: #selector(clickBtn), for: .touchUpOutside)
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 16
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.red.cgColor
        return btn
    }()
    @objc func clickBtn(){
        
    }
    //MARK:Label
    lazy var label : UILabel = {
       let label = UILabel()
        label.text = "文本"
//        label.textColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.8)
        label.textColor = .blue
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .center
        label.backgroundColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byCharWrapping
//        let attext = NSAttributedString(string: "富文本", attributes: [.font : 18])
//        label.attributedText =
        label.layer.cornerRadius = 8
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.red.cgColor
        return label
    }()
    
    //MARK:Textfield
    lazy var textFieldBackView : UIView = {
        let backView = UIView()
        backView.layer.borderColor = UIColor.gray.cgColor
        backView.layer.borderWidth = 0.5
        backView.layer.cornerRadius = 14
        backView.addSubview(self.textField)
        self.textField.snp.makeConstraints { make in
            make.edges.equalTo(UIEdgeInsetsMake(5, 10, 5, 5))
        }
        return backView
    }()
    lazy var textField : ZJ_TextField = {
        let textField = ZJ_TextField(frame: CGRect.zero, placeholderFrame: CGRect.init(x: 10, y: 5, width: 100, height: 20))
        textField.placeholder = "请输入ID"
        textField.delegate = self
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .whileEditing
        textField.leftViewMode = .always
//        textField.placeholderRect(forBounds: CGRect.init(x: 50, y: 0, width: 150, height: 20))
        
        return textField
    }()
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if(textField.text!.count < 10){
            return true
        }
        return false
    }
    
    //MARK:SWITCH
    lazy var switchBtn : UISwitch = {
       let switchBtn = UISwitch()
        return switchBtn
    }()
    //MARK:Segment
    lazy var segmentBtn : UISegmentedControl
    //MARK:Slider
    
    //MARK:ProgressView
}
