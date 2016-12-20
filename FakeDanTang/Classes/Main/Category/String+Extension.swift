//
//  String+Extension.swift
//  FakeDanTang
//
//  Created by Allen Hsu on 2016/12/20.
//  Copyright © 2016年 Allen Hsu. All rights reserved.
//

import Foundation

public extension String {
	
	//to check mobile number
	static func isValidMobile(string: String) -> Bool {
		let patternString = "^1[3|4|5|7|8][0-9]\\d{8}$"
		//NSPredicate have problem
		let predicate = NSPredicate(format: "SELF MATCHES %@", patternString)
		return predicate.evaluate(with: string)
	}
	
	//to check password 
	static func isVaildPassword(string: String) -> Bool {
		let patternString = "^[0-9A-Za-z]{6,16}$"
		let predicate = NSPredicate(format: "SELF MATCHES %@", patternString)
		return predicate.evaluate(with: string)
	}
	
	//to format price
	static func stringWithFormatMoney(money: Double) -> String {
		var moneyStr: String
		if money < 10000 {
			moneyStr = String(format: "%.2f", money)
		} else {
			let newMoney = money / 10000.0
			moneyStr = String(format: "%.2f萬", newMoney)
		}
		return moneyStr
	}
}
