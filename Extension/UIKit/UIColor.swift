//
//  UIColor.swift
//  swift_ui_util
//
//  Created by lxh on 2021/11/5.
//

import UIKit

extension UIColor {
	public static func black(_ alpha: CGFloat = 1.0) -> UIColor {
		return UIColor.rgb(red: 0, green: 0, blue: 0, alpha: alpha)
	}
}

extension UIColor {
	/// 随机颜色
	class var random: UIColor {
		let range = 0.0..<1.0
		let red = Double.random(in: range)
		let green = Double.random(in: range)
		let blue = Double.random(in: range)
		let color = UIColor.init(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1.0)
		return color
	}

	public class func rgb(red: Int, green: Int, blue: Int, alpha: Double) -> UIColor {
		return UIColor.init(red: CGFloat(red) / 255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: CGFloat(alpha))
	}

	/// 生成十六进制的RGB颜色 如:0xFF00FF
	/// - Parameters:
	///   - num: 如:0xFF00FF
	///   - alpha: 默认是1.0
	public class func hex(_ num: Int, alpha: CGFloat = 1.0) -> UIColor {
		let red = ((CGFloat)((num & 0xFF0000) >> 16)) / 255.0
		let green = ((CGFloat)((num & 0xFF00) >> 8)) / 255.0
		let blue = ((CGFloat)(num & 0xFF)) / 255.0
		return UIColor(red: red, green: green, blue: blue, alpha: alpha)
	}

	/// 将一个16进制的的颜色字符串转换为颜色 支持0x, #开头的颜色. 0xFFFFFF, #ffffff. 两者等价
	/// - Parameters:
	///   - hexStr: 支持0x, #开头的颜色. 0xFFFFFF, #ffffff. 两者等价
	///   - alpha: 默认为1.0
	public class func hex(_ hexStr: String, alpha: CGFloat = 1.0) -> UIColor {
		var cStr = hexStr.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased() as NSString

		if cStr.length < 6 {
			return UIColor.clear
		}

		if cStr.hasPrefix("0x") || cStr.hasPrefix("0X") {
			cStr = cStr.substring(from: 2) as NSString
		}

		if cStr.hasPrefix("#") {
			cStr = cStr.substring(from: 1) as NSString
		}

		if cStr.length != 6 {
			return UIColor.clear
		}

		let rStr = (cStr as NSString).substring(to: 2)
		let gStr = ((cStr as NSString).substring(from: 2) as NSString).substring(to: 2)
		let bStr = ((cStr as NSString).substring(from: 4) as NSString).substring(to: 2)

		var r: UInt32 = 0x0
		var g: UInt32 = 0x0
		var b: UInt32 = 0x0

		Scanner.init(string: rStr).scanHexInt32(&r)
		Scanner.init(string: gStr).scanHexInt32(&g)
		Scanner.init(string: bStr).scanHexInt32(&b)

		return UIColor.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: alpha)
	}
}
