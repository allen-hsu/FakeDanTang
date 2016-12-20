//
//  YMTitlesView.swift
//  FakeDanTang
//
//  Created by Allen Hsu on 2016/12/20.
//  Copyright © 2016年 Allen Hsu. All rights reserved.
//

import UIKit
import SnapKit


class ALTitlesView: UIView {
	
	var indicatorView = UIView()
	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = ALColor(r: 1, g: 1, b: 1, a: 0.7)
		
		
		let indicatorView = UIView()
		indicatorView.backgroundColor = ALColor(r: 245, g: 80, b: 83, a: 1.0)
		indicatorView.tag = -1
		addSubview(indicatorView)
		self.indicatorView = indicatorView
		
		let count = Int()
		
		indicatorView.snp.makeConstraints { (make) -> Void in
			make.height.equalTo(kIndicatorViewH)
			make.bottom.equalTo(self.snp.bottom)
		
		}
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
