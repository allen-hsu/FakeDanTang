//
//  ALCategoryCollectionViewCell.swift
//  FakeDanTang
//
//  Created by Allen Hsu on 2016/12/21.
//  Copyright © 2016年 Allen Hsu. All rights reserved.
//

import UIKit
import Kingfisher

class ALCategoryCollectionViewCell : UICollectionViewCell {
	
	@IBOutlet weak var collectionImageView: UIImageView!
	var collection: ALCollection? {
		didSet {
			let url = collection!.banner_image_url
			collectionImageView.kf.setImage(with: URL(string: url!)!)
		}
	}
	
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
	}
}
