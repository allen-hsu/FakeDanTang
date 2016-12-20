//
//  ALDanTangViewController.swift
//  FakeDanTang
//
//  Created by Allen Hsu on 2016/12/20.
//  Copyright © 2016年 Allen Hsu. All rights reserved.
//

import UIKit

class ALDanTangViewController: ALBaseViewController, UIScrollViewDelegate {
	
	
	var channels = [ALChannel]()
	var contentView = UIScrollView()
	var titlesView = UIView()
	var indicatorView = UIView()
	var selectedButton = UIButton()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupNav()
		weak var weakSelf = self
		
		// 获取首页顶部选择数据
		ALNetworkTool.shareNetworkTool.loadHomeTopData { (ym_channels) in
			for channel in ym_channels {
				let vc = ALTopicViewController()
				vc.title = channel.name!
				weakSelf!.addChildViewController(vc)
			}
			//设置顶部标签栏
			weakSelf!.setupTitlesView()
			// 底部的scrollview
			weakSelf!.setupContentView()
		}
	}
	
	func setupChildViewControllers() {
		for channel in channels {
			let vc = ALTopicViewController()
			vc.title = channel.name
			addChildViewController(vc)
		}
	}
	
	func setupTitlesView() {
		// 顶部背景
		let bgView = UIView()
		
		bgView.frame = CGRect(x: 0, y: kTitlesViewY, width: SCREENW, height: kTitlesViewH)
		view.addSubview(bgView)
		// 标签
		let titlesView = UIView()
		titlesView.backgroundColor = ALGlobalColor()
		titlesView.frame = CGRect(x: 0, y: 0, width: SCREENW - kTitlesViewH, height: kTitlesViewH)
		bgView.addSubview(titlesView)
		self.titlesView = titlesView
		//底部红色指示器
		let indicatorView = UIView()
		indicatorView.backgroundColor = ALGlobalRedColor()
		indicatorView.height = kIndicatorViewH
		indicatorView.y = kTitlesViewH - kIndicatorViewH
		indicatorView.tag = -1
		self.indicatorView = indicatorView
		
		// 选择按钮
		let arrowButton = UIButton()
		
		arrowButton.frame = CGRect(x: SCREENW - kTitlesViewH, y: 0, width: kTitlesViewH, height: kTitlesViewH)
		arrowButton.setImage(UIImage(named: "arrow_index_down_8x4_"), for: .normal)
		arrowButton.addTarget(self, action: #selector(arrowButtonClick(button:)), for: .touchUpInside)
		arrowButton.backgroundColor = ALGlobalColor()
		bgView.addSubview(arrowButton)
		
		//内部子标签
		let count = childViewControllers.count
		let width = titlesView.width / CGFloat(count)
		let height = titlesView.height
		
		for index in 0..<count {
			let button = UIButton()
			button.height = height
			button.width = width
			button.x = CGFloat(index) * width
			button.tag = index
			let vc = childViewControllers[index]
			button.titleLabel!.font = UIFont.systemFont(ofSize: 14)
			button.setTitle(vc.title!, for: .normal)
			button.setTitleColor(UIColor.gray, for: .normal)
			button.setTitleColor(ALGlobalRedColor(), for: .disabled)
			button.addTarget(self, action: #selector(self.titlesClick(button:)), for: .touchUpInside)
			titlesView.addSubview(button)
			//默认点击了第一个按钮
			if index == 0 {
				button.isEnabled = false
				selectedButton = button
				//让按钮内部的Label根据文字来计算内容
				button.titleLabel?.sizeToFit()
				indicatorView.width = button.titleLabel!.width
				indicatorView.centerX = button.centerX
			}
		}
		//底部红色指示器
		titlesView.addSubview(indicatorView)
	}
	
	func arrowButtonClick(button: UIButton) {
		UIView.animate(withDuration: kAnimationDuration) {
			button.imageView?.transform = button.imageView!.transform.rotated(by: CGFloat(M_PI))
		}
	}
	
	func titlesClick(button: UIButton) {
		selectedButton.isEnabled = true
		button.isEnabled = false
		selectedButton = button
	
		UIView.animate(withDuration: kAnimationDuration) {
			self.indicatorView.width = self.selectedButton.titleLabel!.width
			self.indicatorView.centerX = self.selectedButton.centerX
		}

		var offset = contentView.contentOffset
		offset.x = CGFloat(button.tag) * contentView.width
		contentView.setContentOffset(offset, animated: true)
	}
	
	
	func setupContentView() {

		automaticallyAdjustsScrollViewInsets = false
		
		let contentView = UIScrollView()
		contentView.frame = view.bounds
		contentView.delegate = self
		contentView.contentSize = CGSize(width: contentView.width * CGFloat(childViewControllers.count), height: 0)
		contentView.isPagingEnabled = true
		view.insertSubview(contentView, at: 0)
		self.contentView = contentView
		scrollViewDidEndScrollingAnimation(scrollView: contentView)
	}
	
	func setupNav() {
		view.backgroundColor = UIColor.white
		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Feed_SearchBtn_18x18_"), style: .plain, target: self, action: #selector(dantangRightBBClick))
	}
	
	func dantangRightBBClick() {
		print(#function)
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	// MARK: - UIScrollViewDelegate
	func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
		// 添加子控制器的 view
		// 当前索引
		let index = Int(scrollView.contentOffset.x / scrollView.width)
		// 取出子控制器
		let vc = childViewControllers[index]
		vc.view.x = scrollView.contentOffset.x
		vc.view.y = 0 // 设置控制器的y值为0(默认为20)
		//设置控制器的view的height值为整个屏幕的高度（默认是比屏幕少20）
		vc.view.height = scrollView.height
		scrollView.addSubview(vc.view)
	}
	
	func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
		scrollViewDidEndScrollingAnimation(scrollView: scrollView)
		// 当前索引
		let index = Int(scrollView.contentOffset.x / scrollView.width)
		// 点击 Button
		print(index)
		
	}
}
