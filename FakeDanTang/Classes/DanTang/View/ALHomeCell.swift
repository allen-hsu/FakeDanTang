//
//  ALHomeCell.swift
//  FakeDanTang
//
//  Created by Allen Hsu on 2016/12/20.
//  Copyright © 2016年 Allen Hsu. All rights reserved.
//

import UIKit
import Kingfisher

protocol ALHomeCellDelegate: NSObjectProtocol {
	func homeCellDidClickedFavoriteButton(button: UIButton)
}

class ALHomeCell: UITableViewCell {
	weak var delegate: ALHomeCellDelegate?
	
	@IBOutlet weak var bgImageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var favoriteBtn: UIButton!
	@IBOutlet weak var placeholderBtn: UIButton!
	var homeItem: ALHomeItem? {
		didSet{
			let url = homeItem!.cover_image_url
			
			bgImageView.kf.setImage(with: URL(string: url!)!, placeholder: nil, options: nil, progressBlock: nil) { (image, error, cacheType, imageURL) in
				self.placeholderBtn.isHidden = true
			}
			titleLabel.text = homeItem!.title
			favoriteBtn.setTitle(" " + String(homeItem!.likes_count!) + " ", for: .normal)
		}
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
	}
	@IBAction func favoriteButtononClick(_ sender: UIButton) {
		delegate?.homeCellDidClickedFavoriteButton(button: sender)
	}
}
