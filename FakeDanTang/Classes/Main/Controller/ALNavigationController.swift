//
//  ALNavigationController.swift
//  FakeDanTang
//
//  Created by Allen Hsu on 2016/12/20.
//  Copyright © 2016年 Allen Hsu. All rights reserved.
//

import UIKit
import SVProgressHUD

class ALNavigationController: UINavigationController {
	
	internal override class func initialize() {
		super.initialize()
		/// 设置导航栏标题
		let navBar = UINavigationBar.appearance()
		navBar.barTintColor = ALColor(r: 245, g: 80, b: 83, a: 1.0)
		navBar.tintColor = UIColor.white
		navBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: UIFont.systemFont(ofSize: 20)]
	}
	/**
	# 统一所有控制器导航栏左上角的返回按钮
	# 让所有push进来的控制器，它的导航栏左上角的内容都一样
	# 能拦截所有的push操作
	- parameter viewController: 需要压栈的控制器
	- parameter animated:       是否动画
	*/
	override func pushViewController(_ viewController: UIViewController, animated: Bool) {
		/// 这时push进来的控制器viewController，不是第一个子控制器（不是根控制器）
		if viewControllers.count > 0 {
			viewController.hidesBottomBarWhenPushed = true
			viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "checkUserType_backward_9x15_"), style: .plain, target: self, action: #selector(navigationBackClick))
		}
		super.pushViewController(viewController, animated: true)
	}
	
	func navigationBackClick() {
		if SVProgressHUD.isVisible() {
			SVProgressHUD.dismiss()
		}
		if UIApplication.shared.isNetworkActivityIndicatorVisible {
			UIApplication.shared.isNetworkActivityIndicatorVisible = false
		}
		popViewController(animated: true)
	}
	
}

