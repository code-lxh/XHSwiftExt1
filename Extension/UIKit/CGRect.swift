//
//  CGRect.swift
//  swift_ui_util
//
//  Created by lxh on 2021/11/5.
//

import UIKit

extension CGRect {
	public var x: CGFloat {
		get {
			return self.origin.x
		}

		set(newValue) {
			self = CGRect(x: newValue, y: self.y, width: self.width, height: self.height)
		}
	}

	public var y: CGFloat {
		get {
			return self.origin.y
		}
		set(newValue) {
			self = CGRect(x: self.x, y: newValue, width: self.width, height: self.height)
		}
	}

	public var width: CGFloat {
		get {
			return self.size.width
		}
		set(newValue) {
			self = CGRect(x: self.origin.x, y: self.origin.y, width: newValue, height: self.size.height)
		}
	}
	public var height: CGFloat {
		get {
			return self.size.height
		}
		set(newValue) {
			self = CGRect(x: self.origin.x, y: self.origin.y, width: self.size.width, height: newValue)
		}
	}
}
