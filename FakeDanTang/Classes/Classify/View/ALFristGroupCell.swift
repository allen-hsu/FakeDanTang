//
//  ALFristGroupCell.swift
//  FakeDanTang
//
//  Created by Allen Hsu on 2016/12/21.
//  Copyright © 2016年 Allen Hsu. All rights reserved.
//

import UIKit
import Kingfisher

class ALFirstGroupCell: UITableViewCell {
	var groups = [ALGroup]()
	
	
	@IBOutlet weak var firstButton: UIButton!
	@IBOutlet weak var secondButton: UIButton!
	@IBOutlet weak var thirdButton: UIButton!
	@IBOutlet weak var forthButton: UIButton!
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupUI()
	}
	
	func setupUI() {
		// 标题
		let label = UILabel()
		label.x = 10
		label.height = 35
		label.text = "风格"
		label.textColor = ALColor(r: 0, g: 0, b: 0, a: 0.6)
		label.font = UIFont.systemFont(ofSize: 15)
		contentView.addSubview(label)
		// 创建按钮
		for _ in 0..<groups.count {
			let button = UIButton()
			
			contentView.addSubview(button)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		
		// Configure the view for the selected state
	}
	
}

