//
//  ALCategoryViewController.swift
//  FakeDanTang
//
//  Created by Allen Hsu on 2016/12/20.
//  Copyright © 2016年 Allen Hsu. All rights reserved.
//

import UIKit

class ALCategoryViewController: ALBaseViewController {
	override func viewDidLoad() {
		view.backgroundColor = UIColor.white
		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Feed_SearchBtn_18x18_"), style: .plain, target: self, action: #selector(categoryRightBBClick))
	}
	
	func categoryRightBBClick() {
		print(#function)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

}
