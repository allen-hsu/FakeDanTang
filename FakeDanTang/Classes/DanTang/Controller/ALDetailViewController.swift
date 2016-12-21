//
//  ALDetailViewController.swift
//  FakeDanTang
//
//  Created by Allen Hsu on 2016/12/21.
//  Copyright © 2016年 Allen Hsu. All rights reserved.
//

import UIKit
import SVProgressHUD

class ALDetailViewController: ALBaseViewController,UIWebViewDelegate {
	
	var homeItem: ALHomeItem?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		let webView = UIWebView()
		webView.frame = view.bounds
		/// 自动对页面进行缩放以适应屏幕
		webView.scalesPageToFit = true
		webView.dataDetectorTypes = .all
		let url = NSURL(string: homeItem!.content_url!)
		let request = NSURLRequest(url: url! as URL)
		webView.loadRequest(request as URLRequest)
		webView.delegate = self
		view.addSubview(webView)
	}
	
	func webViewDidStartLoad(webView: UIWebView) {
		SVProgressHUD.setStatus("正在加载...")
		UIApplication.shared.isNetworkActivityIndicatorVisible = true
	}
	
	func webViewDidFinishLoad(webView: UIWebView) {
		SVProgressHUD.dismiss()
		UIApplication.shared.isNetworkActivityIndicatorVisible = false
		print(webView.stringByEvaluatingJavaScript(from: "document.documentElement.innerHTML"))
	}
	
	func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
		
		
		
		return true
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
}
