//
//  ALTopicViewController.swift
//  FakeDanTang
//
//  Created by Allen Hsu on 2016/12/20.
//  Copyright © 2016年 Allen Hsu. All rights reserved.
//

import UIKit

class ALTopicViewController: ALBaseViewController {
	
	var items = [ALHomeItem]()
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = ALGlobalColor()
		// 获取首页数据
		weak var weakSelf = self
		ALNetworkTool.shareNetworkTool.loadHomeInfo(id: 4) { (homeItems) in
			weakSelf!.items = homeItems
		}

		// Do any additional setup after loading the view.
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}
