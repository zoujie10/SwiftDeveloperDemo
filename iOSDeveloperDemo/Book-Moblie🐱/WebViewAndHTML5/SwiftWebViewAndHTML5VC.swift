//
//  SwiftWebViewAndHTML5VC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/11/14.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit
import WebKit
//WKWebView
//1.加载网页
//2.加载HTML字符串 和GIF动画
//3.加载本地网页
//4.回调原生程序
//
class SwiftWebViewAndHTML5VC: UIViewController {
//    var webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let config = WKWebViewConfiguration()
        var webView = WKWebView(frame: view.bounds, configuration: config)
        let url = URL.init(string: "www.baidu.com")
        webView.loadHTMLString("", baseURL: url!)
    }
    


}
