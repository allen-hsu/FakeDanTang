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
							let homeItem = ALHomeItem(dict: item as! [String: Any])
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
							let ym_channel = ALChannel(dict: channel as! [String: Any])
							ym_channels.append(ym_channel)
						}
						finished(ym_channels)
					}
				}
		}
	}
	
	func loadProductData(finished:@escaping (_ products: [ALProduct]) -> ()) {
		SVProgressHUD.show(withStatus: "正在加载...")
		let url = BASE_URL + "v2/items?gender=1&generation=1&limit=20&offset=0"
		Alamofire
			.request(url)
			.responseJSON { (response) in
				guard response.result.isSuccess else {
					SVProgressHUD.showError(withStatus: "加载失败...")
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
					if let data = dict["data"].dictionary {
						if let items = data["items"]?.arrayObject as?[[String: Any]] {
							var products = [ALProduct]()
							for item in items {
								guard let itemData = item["data"] as? [String: Any] else {
									continue
								}
								
								let product = ALProduct(dict: itemData )
								products.append(product)
								
							}
							finished(products)
						}
					}
				}
		}
	}
	
	/// 分类界面 顶部 专题合集
	func loadCategoryCollection(finished:@escaping (_ collections: [ALCollection]) -> ()) {
		SVProgressHUD.show(withStatus: "正在加载...")
		let url = BASE_URL + "v1/collections?limit=6&offset=0"
		Alamofire
			.request(url)
			.responseJSON { (response) in
				guard response.result.isSuccess else {
					SVProgressHUD.showError(withStatus: "加载失败...")
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
					if let data = dict["data"].dictionary {
						if let collectionsData = data["collections"]?.arrayObject {
							var collections = [ALCollection]()
							for item in collectionsData {
								let collection = ALCollection(dict: item as! [String: Any])
								collections.append(collection)
							}
							finished(collections)
						}
					}
				}
		}
	}
	
	/// 分类界面 风格,品类
	func loadCategoryGroup(finished:@escaping (_ outGroups: [Any]) -> ()) {
		SVProgressHUD.show(withStatus: "正在加载...")
		let url = BASE_URL + "v1/channel_groups/all?"
		Alamofire
			.request(url)
			.responseJSON { (response) in
				guard response.result.isSuccess else {
					SVProgressHUD.showError(withStatus: "加载失败...")
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
					if let data = dict["data"].dictionary {
						if let channel_groups = data["channel_groups"]?.arrayObject as? [[String: Any]] {
							// outGroups 存储两个 inGroups 数组，inGroups 存储 YMGroup 对象
							// outGroups 是一个二维数组
							var outGroups = [Any]()
							var inGroups = [ALGroup]()
							for channel_group in channel_groups {
								let channels = channel_group["channels"] as! [Any]
								for channel in channels {
									let group = ALGroup(dict: channel as! [String: Any])
									inGroups.append(group)
								}
								outGroups.append(inGroups)
							}
							finished(outGroups)
						}
					}
				}
		}
	}


}
