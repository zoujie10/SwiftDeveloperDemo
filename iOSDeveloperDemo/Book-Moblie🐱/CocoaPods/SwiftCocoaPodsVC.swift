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

        /**
            1.CocoaPods,SPM,Carthage
            2.CocoaPods-app使用
         
         */
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
