//
//  UIKitComponentVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/10/11.
//  Copyright © 2021 Zoujie. All rights reserved.
//
//常用控件
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
        self.view.addSubview(self.switchBtn)
        self.view.addSubview(self.segmentBtn)
        self.view.addSubview(self.slider)
        self.view.addSubview(self.progressView)
        
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
            make.width.equalTo(150)
            make.height.equalTo(30)
        }
        
        self.switchBtn.snp.makeConstraints{
            $0.left.equalTo(self.btn)
            $0.top.equalTo(self.textFieldBackView.snp_bottom).offset(20)
        }
        
        self.segmentBtn.snp.makeConstraints{
            $0.left.equalTo(self.btn)
            $0.top.equalTo(self.switchBtn.snp_bottom).offset(20)
        }
        
        self.slider.snp.makeConstraints{
            $0.left.equalTo(self.btn)
            $0.top.equalTo(self.segmentBtn.snp_bottom).offset(20)
            $0.width.equalTo(200)
        }
        
        self.progressView.snp.makeConstraints{
            $0.left.equalTo(self.btn)
            $0.top.equalTo(self.slider.snp_bottom).offset(20)
            $0.width.equalTo(200)
        }
    }
    
    
    //MARK：用户交互 UICotrol -- (target - action)机制
    lazy var control : UIControl = {
      let control = UIControl()
        control.contentVerticalAlignment = .bottom
//        control.contentHorizontalAlignment = .center
        control.contentMode = .top
        let state = control.state
        
        return control
    }()
    
    //MARK: Button
    lazy var btn : UIButton = {
        let btn = UIButton()
        btn.setTitle("按钮", for: .normal)
        btn.setTitleColor(.red, for: .normal)
        btn.addTarget(self, action: #selector(clickBtn), for: .touchUpInside)
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 16
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.red.cgColor
        let str : String = "示例图片"
        let nsstr = NSMutableAttributedString.init(string: str as String)
        var range = NSRange()
        range.location = 0
        range.length = str.count
        nsstr.addAttributes([NSAttributedString.Key.underlineStyle : NSNumber(value: NSUnderlineStyle.styleSingle.rawValue)], range:range)
        btn .setAttributedTitle(nsstr, for: .normal)//系统的 只有下划线紧贴文字的效果
        return btn
    }()
    
    @objc func clickBtn(sender : UIButton){
        print("switchBtn----状态---\(self.switchBtn.isOn)")
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
        
        label.shadowColor = .red
        label.shadowOffset = CGSize(width: 2, height: 2)
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
    lazy var textField : UITextField = {
//        let textField = ZJ_TextField(frame: CGRect.zero, placeholderFrame: CGRect.init(x: 10, y: 0, width: 100, height: 20))
        let textField = UITextField()
        textField.placeholder = "请输入ID"
        textField.delegate = self
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .whileEditing
        textField.leftViewMode = .always
        textField.rightViewMode = .always
        let searchBtn = UIButton(type: .custom)
        searchBtn.frame = CGRect.init(x: 0, y: 0, width: 20, height: 20)
        searchBtn.setBackgroundImage(UIImage.init(named: "France"), for: .normal)
        textField.rightView = searchBtn
        return textField
    }()
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if(textField.text!.count < 10){
            return true
        }
        return false
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.textField.resignFirstResponder()
    }
    //MARK:SWITCH
    lazy var switchBtn : UISwitch = {
       let switchBtn = UISwitch()
        switchBtn.onTintColor = .red
        switchBtn.thumbTintColor = .orange
        switchBtn.addTarget(self, action: #selector(clickSwitchBtn), for: .touchUpInside)
        return switchBtn
    }()
    @objc func clickSwitchBtn(){
        print("switchBtn----状态---\(self.switchBtn.isOn)")
        let vc = WWAfterSaleDisplayPicEgVC()
        vc.modalPresentationStyle = .overFullScreen
        vc.clickBlock = {
            print("block 回调")
        }
        self.present(vc, animated: true, completion: nil)
    }
    
    //MARK:Segment
    lazy var segmentBtn : UISegmentedControl = {
        let segmentBtn = UISegmentedControl(items: ["1","2","3","4"])
        segmentBtn.addTarget(self, action: #selector(clicksegmentBtn), for: .valueChanged)//重点action event .valueChanged
        segmentBtn.selectedSegmentIndex = 0
        return segmentBtn
    }()
    @objc func clicksegmentBtn(){
        print("sclicksegmentBtn----状态---\(self.segmentBtn.selectedSegmentIndex)")
    }
    //MARK:Slider
    lazy var slider : UISlider = {
       let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 1;
        slider.maximumValueImage = UIImage.init(named: "ww_shoping_carts_submit_Integration_add")
        slider.minimumValueImage = UIImage.init(named: "ww_shoping_carts_submit_Integration_reduce")
        slider.addTarget(self, action: #selector(clickSliderBtn), for: .valueChanged)
        return slider
    }()
    @objc func clickSliderBtn(){
        print("UISliderBtn----状态---\(self.slider.value)")
        self.progressView.progress = self.slider.value
    }
    
    //MARK:ProgressView
    lazy var progressView : UIProgressView = {
       let progressView = UIProgressView()
        progressView.progressViewStyle = .bar
        progressView.progressTintColor = .red
        progressView.backgroundColor = .green
        return progressView
    }()
    
    lazy var refreshControl : UIRefreshControl = {
       let refreshContrl = UIRefreshControl()
        refreshContrl.attributedTitle = NSAttributedString(string: "松开后自动刷新")
        refreshContrl.addTarget(self, action: #selector(refreshControlBtn), for: .valueChanged)
//        tableview.addsubview.(refreshContrl)
        return refreshContrl
    }()
    @objc func refreshControlBtn(){
//        self.tableview.reload
        self.refreshControl.endRefreshing()
    }
}
