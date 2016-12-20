//
//  ALChannel.swift
//  FakeDanTang
//
//  Created by Allen Hsu on 2016/12/20.
//  Copyright © 2016年 Allen Hsu. All rights reserved.
//

import Foundation

import UIKit

class ALChannel: NSObject {
	var editable: Bool?
	var id: Int?
	var name: String?
	
	init(dict: [String: Any]) {
		id = dict["id"] as? Int
		name = dict["name"] as? String
		editable = dict["editable"] as? Bool
	}
}
