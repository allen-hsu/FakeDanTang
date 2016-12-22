//
//  ALVerticalButton.swift
//  FakeDanTang
//
//  Created by Allen Hsu on 2016/12/21.
//  Copyright © 2016年 Allen Hsu. All rights reserved.
//

import UIKit
import Kingfisher

class ALVerticalButton: UIButton {
	var group: ALGroup? {
		didSet {
			let url = group!.icon_url
			imageView?.kf.setImage(with: URL(string: url!)!)
			titleLabel?.text = group!.name
		}
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		titleLabel?.textAlignment = .center
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		// 调整图片
		imageView?.x = 0
		imageView?.y = 0
		imageView?.width = self.width
		imageView?.height = imageView!.width
		// 调整文字
		titleLabel?.x = 0
		titleLabel?.y = imageView!.height
		titleLabel?.width = imageView!.width
		titleLabel?.height = self.height - self.titleLabel!.y
	}
}
