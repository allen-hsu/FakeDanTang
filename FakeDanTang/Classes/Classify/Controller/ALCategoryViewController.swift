//
//  ALCategoryViewController.swift
//  FakeDanTang
//
//  Created by Allen Hsu on 2016/12/20.
//  Copyright © 2016年 Allen Hsu. All rights reserved.
//

import UIKit
let categoryGroupFirstID = "categoryGroupFirstID"
let categoryGroupSecondID = "categoryGroupSecondID"

class ALCategoryViewController: ALBaseViewController, UITableViewDelegate, UITableViewDataSource{
	var outGroups = [Any]()
	
	weak var tableView = UITableView()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Feed_SearchBtn_18x18_"), style: .plain, target: self, action: #selector(categoryRightBBClick))
		
		
		setupTableView()
		
		/// 分类界面 风格,品类
		weak var weakSelf = self
		ALNetworkTool.shareNetworkTool.loadCategoryGroup { (outGroups) in
			weakSelf?.outGroups = outGroups
			weakSelf?.tableView?.reloadData()
		}
	}
	
	private func setupTableView() {
		let tableView = UITableView()
		tableView.frame = view.bounds
		tableView.delegate = self
		tableView.dataSource = self
		// 顶部专题合集
		tableView.tableHeaderView = setupHeaderView()
		tableView.tableFooterView = UIView()
		tableView.separatorStyle = .none
		//        let firstNib = UINib(nibName: String(YMFirstGroupCell), bundle: nil)
		//        tableView.registerNib(firstNib, forCellReuseIdentifier: categoryGroupFirstID)
		//        let secondNib = UINib(nibName: String(YMSecondTableViewCell), bundle: nil)
		//        tableView.registerNib(secondNib, forCellReuseIdentifier: categoryGroupSecondID)
		tableView.register(ALFirstGroupCell.self, forCellReuseIdentifier: categoryGroupFirstID)
		//tableView.register(ALSecondTableViewCell.self, forCellReuseIdentifier: categoryGroupSecondID)
		view.addSubview(tableView)
		self.tableView = tableView
	}
	
	private func setupHeaderView() -> UIView {
		let headerViewController = ALCategoryHeaderViewController()
		addChildViewController(headerViewController)
		
		let bgView = UIView(frame: CGRect(x: 0, y: kTitlesViewY, width: SCREENW, height: 150))
		view.addSubview(bgView)
		let headerVC = childViewControllers[0]
		bgView.addSubview(headerVC.view)
		return bgView
	}
	
	func categoryRightBBClick() {
		print(#function)
	}
	
	// MARK: - UITableViewDataSource
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return outGroups.count
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if indexPath.section == 0 {
			let cell = tableView.dequeueReusableCell(withIdentifier: categoryGroupFirstID) as! ALFirstGroupCell
			cell.selectionStyle = .none
			cell.groups = outGroups[indexPath.section] as! [ALGroup]
			return cell
		} else {
			let cell = tableView.dequeueReusableCell(withIdentifier: categoryGroupSecondID) as! ALSecondTableViewCell
			cell.selectionStyle = .none
			cell.groups = outGroups[indexPath.section] as! [ALGroup]
			return cell
		}
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		if indexPath.section == 0 {
			return CGFloat(150)
		} else if indexPath.section == 1 {
			return CGFloat(250)
		}
		return 0
	}
	
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return kMargin
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}
