//
//  DetailViewController.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2018/5/30.
//  Copyright © 2018年 Zoujie. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController,WKNavigationDelegate,WKUIDelegate{

	var url : NSString!
	@IBOutlet var progressForWeb: UIProgressView!
	@IBOutlet var DetailWebView: WKWebView!
	
	@IBAction func ToInfoController(_ sender: UIBarButtonItem) {
		let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "modelVC")
		self.present(vc, animated: true) {
			
		}
	}
	override func viewDidLoad() {
        super.viewDidLoad()
		
		progressForWeb.progress = 0;

		let URLstring : String = self.url as String
		let url = NSURL(string: URLstring as String)
        let request = NSURLRequest(url: url! as URL)
		DetailWebView.load(request as URLRequest)
		
    }
	
	override func viewWillDisappear(_ animated: Bool) {
		DetailWebView.removeObserver(self, forKeyPath: "estimatedProgress")
	}
	override func viewWillAppear(_ animated: Bool) {
		DetailWebView.addObserver(self, forKeyPath: "estimatedProgress", options: NSKeyValueObservingOptions.new, context: nil)
	}
	//MARK:代理
	//请求服务器跳转请求
	func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
		
	}
	//发送请求前，决定是否跳转
	func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
		if (navigationAction.navigationType == .linkActivated){
			decisionHandler(.cancel)
		} else {
			decisionHandler(.allow)
		}
		
	}
	//收到响应后，决定是否跳转
	func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {

	}
	
	//获取进度条比例
	override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {

		if keyPath == "estimatedProgress" {
			progressForWeb.alpha = 1.0
			progressForWeb.setProgress(Float(DetailWebView.estimatedProgress), animated: true)
			print("progress:",DetailWebView.estimatedProgress)
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
		
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
