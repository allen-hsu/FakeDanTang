//
//  ALProductViewController.swift
//  FakeDanTang
//
//  Created by Allen Hsu on 2016/12/20.
//  Copyright © 2016年 Allen Hsu. All rights reserved.
//

import UIKit

let collectionCellID = "ALCollectionViewCell"

class ALProductViewController : ALBaseViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, ALCollectionViewCellDelegate {
	
	var products = [ALProduct]()
	weak var collectionView: UICollectionView?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = UIColor.white
		// Do any additional setup after loading the view.
		setupCollectionView()
		
		weak var weakSelf = self
		ALNetworkTool.shareNetworkTool.loadProductData { (products) in
			weakSelf!.products = products
			weakSelf!.collectionView!.reloadData()
		}

	}
	
	private func setupCollectionView() {
		let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
		collectionView.delegate = self
		collectionView.backgroundColor = view.backgroundColor
		collectionView.dataSource = self
		let nib = UINib(nibName: String(describing: ALCollectionViewCell.self), bundle: nil)
		collectionView.register(nib, forCellWithReuseIdentifier: collectionCellID)
		view.addSubview(collectionView)
		self.collectionView = collectionView
	}

	
	// MARK: - UICollectionViewDataSource
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return products.count ?? 0
	}
	
	internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellID, for: indexPath) as! ALCollectionViewCell
		cell.product = products[indexPath.item]
		cell.delegate = self
		return cell
	}
	
	// MARK: - UICollectionViewDelegate
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let productDetailVC = ALProductDetailViewController()
		productDetailVC.title = "商品详情"
		navigationController?.pushViewController(productDetailVC, animated: true)
	}
	// MARK: - UICollectionViewDelegateFlowLayout
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let width: CGFloat = (UIScreen.main.bounds.width - 20) / 2
		let height: CGFloat = 245
		return CGSize(width: width, height: height)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsetsMake(5, 5, 5, 5)
	}
	
	// MARK: - YMCollectionViewCellDelegate
	func collectionViewCellDidClickedLikeButton(button: UIButton) {
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}
