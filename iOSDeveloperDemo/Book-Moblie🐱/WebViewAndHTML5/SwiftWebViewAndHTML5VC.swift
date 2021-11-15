//
//  SwiftWebViewAndHTML5VC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/11/14.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit
import WebKit

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
