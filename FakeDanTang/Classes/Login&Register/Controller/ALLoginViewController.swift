//
//  ALLoginViewController.swift
//  FakeDanTang
//
//  Created by Allen Hsu on 2016/12/20.
//  Copyright © 2016年 Allen Hsu. All rights reserved.
//

import UIKit

class ALLoginViewController: ALBaseViewController {
	
	@IBOutlet weak var mobileField: UITextField!
	@IBOutlet weak var passwordField: UITextField!
	@IBOutlet weak var loginButton: UIButton!
	@IBOutlet weak var forgetPwdBtn: UIButton!
	override func viewDidLoad() {
		super.viewDidLoad()
		// 设置导航栏的左右按钮
		setupBarButtonItem()
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		
	}
	
	// MARK: - 设置导航栏按钮
	private func setupBarButtonItem() {
		navigationItem.leftBarButtonItem = UIBarButtonItem(title: "取消", style: .plain, target: self, action: #selector(cancelButtonClick))
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "注册", style: .plain, target: self, action: #selector(regiisterButtonClick))
	}
	
	/// 取消按钮点击
	func cancelButtonClick() {
		dismiss(animated: true, completion: nil)
	}
	/// 注册按钮点击
	func regiisterButtonClick() {
		let registerVC = ALRegisterViewController()
		registerVC.title = "注册"
		navigationController?.pushViewController(registerVC, animated: true)
	}
	
	/// - 其他社交账号登录
//	@IBAction func otherLoginButtonClick(sender: UIButton) {
//		if let buttonType = YMOtherLoginButtonType(rawValue: sender.tag) {
//			switch buttonType {
//			case .weiboLogin:
//				
//				break
//			case .weChatLogin:
//				
//				break
//			case .QQLogin:
//				
//				break
//			}
//		}
//	}

}
