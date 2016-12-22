//
//  ALTopHeaderView.swift
//  FakeDanTang
//
//  Created by Allen Hsu on 2016/12/21.
//  Copyright © 2016年 Allen Hsu. All rights reserved.
//

import UIKit

protocol ALTopHeaderViewDelegate: NSObjectProtocol {
	func topViewDidClickedMoreButton(button: UIButton)
}

class ALTopHeaderView: UIView {
	
	weak var delegate: ALTopHeaderViewDelegate?
	
	@IBAction func viewAllButton(_ sender: UIButton) {
		delegate?.topViewDidClickedMoreButton(button: sender)

	}
}
