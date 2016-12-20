//
//  ALBaseViewController.swift
//  FakeDanTang
//
//  Created by Allen Hsu on 2016/12/20.
//  Copyright © 2016年 Allen Hsu. All rights reserved.
//

import UIKit
import SVProgressHUD

class ALBaseViewController: UIViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		//navigationController?.f

		view.backgroundColor = UIColor(red: 245 / 255, green: 245 / 255, blue: 245 / 255, alpha: 1.0)
		SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.custom)
		SVProgressHUD.setMinimumDismissTimeInterval(1.0)
		SVProgressHUD.setBackgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.5))
		SVProgressHUD.setForegroundColor(UIColor.white)
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
}
