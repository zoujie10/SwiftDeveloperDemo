//
//  WebDemoViewController.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2018/5/8.
//  Copyright © 2018年 Zoujie. All rights reserved.
//

import UIKit
import WebKit
class WebDemoViewController: UIViewController, WKNavigationDelegate,WKUIDelegate{

	@IBOutlet var newProView: UIProgressView!
	
	@IBOutlet var progressLine: UIProgressView!
	
	@IBOutlet var webViewDeprecated: UIWebView!
	
	@IBOutlet var NewWebKit: WKWebView!
	
	@IBAction func loadHTMLStringBtn(_ sender: UIButton) {
		
	}
	
	@IBAction func LoadDataBtn(_ sender: UIButton) {
		
	}
	
	@IBAction func LoadRequestBtn(_ sender: UIButton) {
		//创建网址
		let url = NSURL(string: "http://www.baidu.com")
		//创建请求
		let request  = NSURLRequest(url: url! as URL)
		//加载请求
		NewWebKit.load(request as URLRequest)
		
	}
	override func viewDidLoad() {
        super.viewDidLoad()
		newProView.progress = 0
		NewWebKit.addObserver(self, forKeyPath: "estimatedProgress", options: NSKeyValueObservingOptions.new, context: nil)
        // Do any additional setup after loading the view.
    }
	
	override func viewWillDisappear(_ animated: Bool) {
		NewWebKit.removeObserver(self, forKeyPath: "estimatedProgress")
	}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	
	//MARK:代理
	//请求服务器跳转请求
	func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
		
	}
	//发送请求前，决定是否跳转
	func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
		
	}
	//收到响应后，决定是否跳转
	func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
		
	}
	
	//获取进度条比例
	override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {

		if keyPath == "estimatedProgress" {
			newProView.alpha = 1.0
			newProView.setProgress(Float(NewWebKit.estimatedProgress), animated: true)
			print("progress:",NewWebKit.estimatedProgress)
			//进度条的值最大为1.0
//			if(NewWebKit.estimatedProgress >= 1.0) {
//				UIView.animate(withDuration: 0.3, delay: 0.1, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
//					self.progressLine.alpha = 0.0
//				}, completion: { (finished:Bool) -> Void in
//					self.progressLine.progress = 0
//				})
//			}
		}
	}
	
}
