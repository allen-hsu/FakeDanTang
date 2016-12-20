//
//  ALNetworkTool.swift
//  FakeDanTang
//
//  Created by Allen Hsu on 2016/12/20.
//  Copyright © 2016年 Allen Hsu. All rights reserved.
//

import UIKit

import Foundation
import Alamofire
import SVProgressHUD
import SwiftyJSON

class ALNetworkTool: NSObject {
	static let shareNetworkTool = ALNetworkTool()
	
	func loadHomeInfo(id: Int, finished:@escaping (_ homeItems:[ALHomeItem])->()) {
		SVProgressHUD.show(withStatus: "Loading...")
		let url = BASE_URL + "v1/channels/" + String(id) + "/items?gender=1&generation=1&limit=20&offset=0"
		Alamofire
			.request(url)
			.responseJSON { response in
				guard response.result.isSuccess else {
					SVProgressHUD.showError(withStatus: "Loading Fail")
					return
				}
				if let value = response.result.value {
					let dict = JSON(value)
					let code = dict["code"].intValue
					let message = dict["message"].stringValue
					guard code == RETURN_OK else {
						SVProgressHUD.showInfo(withStatus: message)
						return
					}

					SVProgressHUD.dismiss()
					let data = dict["data"].dictionary
					if let items = data!["items"]?.arrayObject {
						var homeItems = [ALHomeItem]()
						for item in items {
							let homeItem = ALHomeItem(dict: item as! [String: AnyObject])
							homeItems.append(homeItem)
						}
						finished(homeItems)
					}
				}
		}
	}
	
	func loadHomeTopData(finished:@escaping (_ ym_channels:[ALChannel]) ->()) {
		let url = BASE_URL + "v2/channels/preset?gender=1&generation=1"
		Alamofire
			.request(url)
			.responseJSON {response in
				guard response.result.isSuccess else {
					SVProgressHUD.showError(withStatus: "Loading Fail")
					return
				}
				if let value = response.result.value {
					let dict = JSON(value)
					let code = dict["code"].intValue
					let message = dict["message"].stringValue
					guard code == RETURN_OK else {
						SVProgressHUD.showInfo(withStatus: message)
						return
					}
					SVProgressHUD.dismiss()
					let data = dict["data"].dictionary
					if let channels = data!["channels"]?.arrayObject {
						var ym_channels = [ALChannel]()
						for channel in channels {
							let ym_channel = ALChannel(dict: channel as! [String: AnyObject])
							ym_channels.append(ym_channel)
						}
						finished(ym_channels)
					}
				}
		}
	}
}
