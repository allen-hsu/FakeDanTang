//
//  ALCategoryHeaderViewController.swift
//  FakeDanTang
//
//  Created by Allen Hsu on 2016/12/21.
//  Copyright © 2016年 Allen Hsu. All rights reserved.
//

import UIKit

let categoryCollectionCellID = "ALCategoryCollectionViewCell"
let categoryHeaderViewID = "ALCategoryHeaderView"


class ALCategoryHeaderViewController: ALBaseViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, ALTopHeaderViewDelegate {
	
	var collections = [ALCollection]()
	
	var collectionView: UICollectionView?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = UIColor.clear
		// 设置 UI
		setupUI()
		/// 分类界面 顶部 专题合集
		ALNetworkTool.shareNetworkTool.loadCategoryCollection { (collections) in
			self.collections = collections
			self.collectionView!.reloadData()
		}
	}
	
	// 设置 UI
	private func setupUI() {
		
		let headerView = Bundle.main.loadNibNamed(String(describing: ALTopHeaderView.self), owner: nil, options: nil)?.last as! ALTopHeaderView
		headerView.frame = CGRect(x: 0, y: 0, width: SCREENW, height: 40)
		headerView.delegate = self
		view.addSubview(headerView)
		
		let flowLayout = UICollectionViewFlowLayout()
		flowLayout.scrollDirection = .horizontal
		
		let collectionView = UICollectionView(frame: CGRect(x: 0, y: 40, width: SCREENW, height: 95), collectionViewLayout: flowLayout)
		collectionView.delegate = self
		collectionView.dataSource = self
		collectionView.showsHorizontalScrollIndicator = false
		collectionView.backgroundColor = UIColor.white
		let cellNib = UINib(nibName: String(describing: ALCategoryCollectionViewCell.self), bundle: nil)
		collectionView.register(cellNib, forCellWithReuseIdentifier: categoryCollectionCellID)
		view.addSubview(collectionView)
		self.collectionView = collectionView
	}
	
	// MARK: - YMTopHeaderViewDelegate
	func topViewDidClickedMoreButton(button: UIButton) {
		let seeMoreVC = ALSeeMoreController()
		navigationController?.pushViewController(seeMoreVC, animated: true)
	}
	
	// MARK: - UICollectionViewDataSource
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return collections.count ?? 0
	}
	
	internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: categoryCollectionCellID, for: indexPath as IndexPath) as! ALCategoryCollectionViewCell
		cell.collection = collections[indexPath.item]
		return cell
	}
	
	// MARK: - UICollectionViewDelegate
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		print(indexPath.item)
	}
	
	// MARK: - UICollectionViewDelegateFlowLayout
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: kitemW, height: kitemH)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsetsMake(kMargin, kMargin, kMargin, kMargin)
	}
	
}

