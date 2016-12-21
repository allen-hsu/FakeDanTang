//
//  ALTopicViewController.swift
//  FakeDanTang
//
//  Created by Allen Hsu on 2016/12/20.
//  Copyright © 2016年 Allen Hsu. All rights reserved.
//

import UIKit
let homeCellID = "homeCellID"

class ALTopicViewController: ALBaseViewController, UITableViewDelegate, UITableViewDataSource, ALHomeCellDelegate {
	

	var type = Int()
	var tableView = UITableView()
	var items = [ALHomeItem]()
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = ALGlobalColor()
		// 获取首页数据
		setupTableView()
		weak var weakSelf = self
		ALNetworkTool.shareNetworkTool.loadHomeInfo(id: 4) { (homeItems) in
			weakSelf!.items = homeItems
			weakSelf?.tableView.reloadData()
		}

		// Do any additional setup after loading the view.
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return items.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let homeCell = tableView.dequeueReusableCell(withIdentifier: homeCellID) as! ALHomeCell
		homeCell.homeItem = items[indexPath.row]
		homeCell.delegate = self
		return homeCell
	}
	
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let detailVC = ALDetailViewController()
		detailVC.homeItem = items[indexPath.row]
		detailVC.title = "攻略详情"
		navigationController?.pushViewController(detailVC, animated: true)
	}
	
	// MARK: - YMHomeCellDelegate
	func homeCellDidClickedFavoriteButton(button: UIButton) {
		let loginVC = ALLoginViewController()
		loginVC.title = "登录"
		let nav = ALNavigationController(rootViewController: loginVC)
		present(nav, animated: true, completion: nil)
	}
	
	
	func setupTableView() {
		let tableView = UITableView()
		tableView.frame = view.bounds
		tableView.delegate = self
		tableView.dataSource = self
		tableView.rowHeight = 160
		tableView.separatorStyle = .none
		tableView.contentInset = UIEdgeInsetsMake(kTitlesViewY + kTitlesViewH, 0, tabBarController!.tabBar.height, 0)
		tableView.scrollIndicatorInsets = tableView.contentInset
		let nib = UINib(nibName: String(describing: ALHomeCell.self), bundle: nil)
		tableView.register(nib, forCellReuseIdentifier: homeCellID)
		view.addSubview(tableView)
		self.tableView = tableView
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}
