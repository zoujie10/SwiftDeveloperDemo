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


//单例
class SwiftProcessPool {
    var processPool : WKProcessPool = WKProcessPool()
    static let sharedInstance = SwiftProcessPool()
    private init() {} // 这就阻止其他对象使用这个类的默认的'()'初始化方法
}

class SwiftWebViewAndHTML5VC: UIViewController,WKScriptMessageHandler,WKNavigationDelegate,WKUIDelegate {
   
    //MARK:Delegate
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print(message.name)
        if(message.name == "isHandLogin"){
            if message.body as! Bool == true{
                self.navigationController?.popViewController(animated: true)
            }else{
                self.webView.reload()
            }
        }
    }
    
    
    
    var webView = WKWebView()
    var progressView = UIProgressView()
    var contentController = WKUserContentController()
    var url = ""
    let scriptArray = ["back",
                "signOut",
                "truedown",
                "isHandLogin",
                "addressChoose",
                "refurbish",
                "webViewJump"]

//    init(){
//        super.init(nibName: nil, bundle: nil)
//    }
    init(url:String,webTitle:String){
        super.init(nibName: nil, bundle: nil)
        self.url = url
        self.title = webTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configWebView()
    }
    override func viewWillAppear(_ animated: Bool) {
      
        for str: String in self.scriptArray{
            self.webView.configuration.userContentController.add(self, name:str)
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        for str: String in self.scriptArray{
            self.webView.configuration.userContentController.removeScriptMessageHandler(forName: str)
        }
    }
    
    
    func configWebView(){
        let config = WKWebViewConfiguration()
        config.processPool = SwiftProcessPool.sharedInstance.processPool
       
        let userContentVC = WKUserContentController()
        let cookiecript = WKUserScript(source: "", injectionTime: .atDocumentStart, forMainFrameOnly: false)
        userContentVC.addUserScript(cookiecript)
        config.userContentController = userContentVC
        
        let preferences = WKPreferences()
        preferences.javaScriptCanOpenWindowsAutomatically = true
        config.preferences = preferences
        
        self.webView = WKWebView(frame: view.bounds, configuration: config)
        view.addSubview(self.webView)
        self.webView.scrollView.showsVerticalScrollIndicator = false
        self.webView.scrollView.showsHorizontalScrollIndicator = false
        
        self.webView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        self.webView.uiDelegate = self
        self.webView.navigationDelegate = self
        view.backgroundColor = .white
        
        /**
                加载网页地址
         */
        let url : NSURL = URL.init(string: self.url)! as NSURL
        let request = NSURLRequest(url: url as URL)
        self.webView.load(request as URLRequest)
//        webView.loadHTMLString("", baseURL:nil)
        
        /**
                获取消息 (_:self,name: "showMessage")
         */
     
        let userVC : WKUserContentController = config.userContentController
        userVC.add(self, name: "showMessage")
        self.contentController = userVC
        
        /**
                进度条
         */
        self.progressView = UIProgressView.init(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 2))
        self.progressView.progressTintColor = UIColor.green
        self.webView.addSubview(self.progressView)
        
    }

    
    
    
    lazy var activityIndicator : UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle:UIActivityIndicatorViewStyle.large)
        activityIndicator.color = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.75)
        let rect : CGRect = self.view.bounds
        activityIndicator.center = CGPoint.init(x: UIScreen.main.bounds.width/2, y: rect.midY)
        self.view.addSubview(activityIndicator)
        return activityIndicator
    }()

}
