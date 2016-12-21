//
//  ALConst.swift
//  FakeDanTang
//
//  Created by Allen Hsu on 2016/12/20.
//  Copyright © 2016年 Allen Hsu. All rights reserved.
//

import UIKit

enum ALTopicType: Int {
	/// 精选
	case Selection = 4
	/// 美食
	case Food = 14
	/// 家居
	case Household = 16
	/// 数码
	case Digital = 17
	/// 美物
	case GoodThing = 13
	/// 杂货
	case Grocery = 22
}

enum YMOtherLoginButtonType: Int {
	/// 微博
	case weiboLogin = 100
	/// 微信
	case weChatLogin = 101
	/// QQ
	case QQLogin = 102
}

let BASE_URL = "http://api.dantangapp.com/"

let ALFirstLaunch = "firstLaunch"

let RETURN_OK = 200

let kMargin: CGFloat = 10.0

let kCornerRadius: CGFloat = 5.0

let klineWidth: CGFloat = 1.0

let kIndicatorViewH: CGFloat = 2.0

let kNewFeatureCount = 5

let kTitlesViewH: CGFloat = 35

let kTitlesViewY: CGFloat = 64

let kAnimationDuration = 0.25

let SCREENW = UIScreen.main.bounds.size.width

let SCREENH = UIScreen.main.bounds.size.height


func ALColor(r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
	return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
}


func ALGlobalColor() -> UIColor {
	return ALColor(r: 245, g: 245, b: 245, a: 1)
}


func ALGlobalRedColor() -> UIColor {
	return ALColor(r: 245, g: 80, b: 83, a: 1.0)
}


let isIPhone5 = SCREENH == 568 ? true : false

let isIPhone6 = SCREENH == 667 ? true : false

let isIPhone6P = SCREENH == 736 ? true : false
