//
//  TextAndImageVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/10/16.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit
import CoreText

class TextAndImageVC: UIViewController {
    let str = " # CocoaPods\n## 安装\n1.检查Ruby版本\ngem --versionplatform:ios,'9.0'  \nuse_frameworks \ntarget 'iOSDeveloperDemo' do \n platform :ios, '10.0' \n   pod 'SnapKit' \n   pod 'Alamofire' \n pod 'Charts' \n pod 'SwiftyJSON'\n #    pod 'RealmSwift' \n   use_frameworks! \nend"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //1.CoreText
        //2.TextKit
        madeTextView()
  
//     let coreText = CoreText()
//        let textView = UITextView()
        
    }

    lazy var mainTextView : UITextView = {
        let mainTextView = UITextView()
        return mainTextView
    }()
    
    func madeTextView(){
        self.mainTextView.text = self.str
        self.view.addSubview(self.mainTextView)
        self.mainTextView.snp.makeConstraints {
            $0.edges.equalTo(self.view)
        }
        
    }
}
