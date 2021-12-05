//
//  SwiftReleaseIPAVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/12/5.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class SwiftReleaseIPAVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //1.iTunes Connect 创建App
        //2.上传App至App Store
        //3.配置构建版本并提交审核
    }
    
    func creatAppMethod(){
        /*首先,进入(https://developer.apple.com/membercenter/index.action)选择 iTunes Connect
         进入输入你的开发者账号 登录即可 选择 我的APP 点击进入
         击右上角的加号 新建你的一个 APP
         
         完整流程<https://blog.csdn.net/ios_xumin/article/details/111194397>
         */
    }
   
    func uploadAppToAppStore(){
        //Transporter
        //<http://www.dongchuanmin.com/archives/591.html>
    }
    
    func configAndSubmitApp(){
        //<https://www.jianshu.com/p/2ae6c6a7dbef>
    }
    
}
