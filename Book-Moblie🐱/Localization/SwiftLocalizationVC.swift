//
//  SwiftLocalizationVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/11/19.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class SwiftLocalizationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "本地化"
        
        view.addSubview(self.languageTextLabel)
        view.addSubview(self.changeLanguageBtn)
        view.addSubview(self.localizedImageView)
        
        self.languageTextLabel.snp.makeConstraints { make in
            make.center.equalTo(view)
        }
        self.changeLanguageBtn.snp.makeConstraints { make in
            make.top.equalTo(self.languageTextLabel.snp_bottom).offset(10)
            make.centerX.equalTo(self.languageTextLabel)
        }
        self.localizedImageView.snp.makeConstraints { make in
            make.top.equalTo(self.changeLanguageBtn.snp_bottom).offset(10)
            make.centerX.equalTo(self.languageTextLabel)
        }
    }
    
    @objc func changeLanguage(){
        //TODO APP 内切换语言 https://blog.csdn.net/Forever_wj/article/details/108210234
        self.languageTextLabel.text = NSLocalizedString("Pro_Name", tableName: "UserService", bundle: Bundle.main, value: "", comment: "")
    }
    //本地化 图片素材不能放在assets中
    lazy var localizedImageView : UIImageView = {
        let localizedImageView = UIImageView()
        localizedImageView.image = UIImage(named: "tiantiansifangmao-07")
        return localizedImageView
    }()
    
    lazy var changeLanguageBtn : UIButton = {
        let changeLanguageBtn = UIButton()
        changeLanguageBtn.setTitle("切换语言", for: .normal)
        changeLanguageBtn.setTitleColor(.black, for: .normal)
        changeLanguageBtn.addTarget(self, action: #selector(changeLanguage), for: .touchUpInside)
        return changeLanguageBtn
    }()
    
    lazy var languageTextLabel : UILabel = {
        let languageTextLabel = UILabel()
        languageTextLabel.textAlignment = .center
        languageTextLabel.backgroundColor = .orange
        languageTextLabel.textColor = .white
        return languageTextLabel;
    }()
}
