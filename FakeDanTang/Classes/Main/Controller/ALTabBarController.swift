//
//  File.swift
//  FakeDanTang
//
//  Created by Allen Hsu on 2016/12/20.
//  Copyright © 2016年 Allen Hsu. All rights reserved.
//

import UIKit

class ALTabBarController: UITabBarController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tabBar.tintColor = UIColor(red: 245 / 255, green: 80 / 255, blue: 83 / 255, alpha: 1.0)
		addChildViewControllers()
	}
	
	private func addChildViewControllers() {
		addChildViewController("ALDanTangViewController", title: "單糖", imageName: "TabBar_home_23x23_")
		addChildViewController("ALProductViewController", title: "單品", imageName: "TabBar_gift_23x23_")
		addChildViewController("ALCategoryViewController", title: "分類", imageName: "TabBar_category_23x23_")
		addChildViewController("ALMeViewController", title: "我", imageName: "TabBar_me_boy_23x23_")
	}
	
	private func addChildViewController(_ childControllerName: String, title: String, imageName: String) {
		let ns = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String

		let cls: AnyClass? = NSClassFromString(ns + "." + childControllerName)
		let vcClass = cls as! UIViewController.Type
		let vc = vcClass.init()
		vc.tabBarItem.image = UIImage(named: imageName)
		vc.tabBarItem.selectedImage = UIImage(named: imageName + "selected")
		vc.title = title
	
		let nav = ALNavigationController()
		nav.addChildViewController(vc)
		addChildViewController(nav)
	}
}
