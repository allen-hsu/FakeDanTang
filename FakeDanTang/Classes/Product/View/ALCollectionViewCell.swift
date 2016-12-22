//
//  ALCollectionViewCell.swift
//  FakeDanTang
//
//  Created by Allen Hsu on 2016/12/21.
//  Copyright © 2016年 Allen Hsu. All rights reserved.
//

import UIKit
import Kingfisher

protocol ALCollectionViewCellDelegate: NSObjectProtocol {
	func collectionViewCellDidClickedLikeButton(button: UIButton)
}

class ALCollectionViewCell: UICollectionViewCell {
	weak var delegate: ALCollectionViewCellDelegate?
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var likeButton: UIButton!
	@IBOutlet weak var placeholderBtn: UIButton!
	@IBOutlet weak var priceLabel: UILabel!
	@IBOutlet weak var productImageView: UIImageView!
	var product: ALProduct? {
		didSet {
			let url = product!.cover_image_url!
			productImageView.kf.setImage(with: URL(string: url)!, placeholder: nil, options: nil, progressBlock: nil) { (image, error, cacheType, imageURL) in
				self.placeholderBtn.isHidden = true
			}
			likeButton.setTitle(" " + String(product!.favorites_count!) + " ", for: .normal)
			titleLabel.text = product!.name
			priceLabel.text = "￥" + String(product!.price!)
		}
	}
	override func awakeFromNib() {
		super.awakeFromNib()
	}

}
