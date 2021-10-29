//
//  SwiftCocoaPodsVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/10/23.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class SwiftCocoaPodsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "CocoaPods"
        /**
            1.CocoaPods,SPM,Carthage
            2.CocoaPods-app使用
         
         */
        madeTextView()
    }
    
    func getTextFileStr(filename:String!) -> String! {
        if let path = Bundle.main.path(forResource: filename, ofType: "txt") {
            do {
                let data = try String(contentsOfFile: path, encoding: .utf8)
                return data
            } catch {
                print(error)
            }
        }
        return ""
    }
    lazy var mainTextView : UITextView = {
        let mainTextView = UITextView()
        return mainTextView
    }()
    
    func madeTextView(){
        self.mainTextView.text = getTextFileStr(filename: "CocoAtext")
        self.view.addSubview(self.mainTextView)
        self.mainTextView.snp.makeConstraints {
            $0.edges.equalTo(self.view)
        }
    }
}
/**
 # CocoaPods
 ## 安装
 1.检查Ruby版本
 gem --version

 版本低于Cocoapods要求时，需要更新Ruby
 换源：
 gem sources --remove https://rubygems.org
 gem sources -a https://ruby.taobao.org
 gem sources -list

 Ruby版本升级：
 sudo gem update --system

 安装CocoaPods：
 sudu gem install cocoapods

 初始化环境：
 pod setup

 Podspec镜像使用:
 pod repo remove master
 pod repo add master https://git.oschina.net/akuandev/Specs.git
 pod repo update

 ## CocoaPods实践
 pod init 创建Podfile文本文件

 ~~~
 platform:ios,'9.0'
 use_frameworks

 target 'iOSDeveloperDemo' do
     platform :ios, '10.0'
     pod 'SnapKit'
     pod 'Alamofire'
   pod 'Charts'
   pod 'SwiftyJSON'
 #    pod 'RealmSwift'
     use_frameworks!
 end
 ~~~

 pod install

 pod update
 ## CocoaPods-app
 */
