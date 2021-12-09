//
//  UIView.swift
//  swift_ui_util
//
//  Created by lxh on 2021/11/5.
//

import UIKit

extension UIView {
	public var x: CGFloat {
		get {
			return self.frame.origin.x
		}

		set(newValue) {
			self.frame = CGRect(x: newValue, y: self.frame.y, width: self.frame.width, height: self.frame.height)
		}
	}

	public var y: CGFloat {
		get {
			return self.frame.origin.x
		}
		set(newValue) {
			self.frame = CGRect(x: self.frame.x, y: newValue, width: self.frame.width, height: self.frame.height)
		}
	}

	public var origin: CGPoint {
		get {
			return self.frame.origin
		}
		set(newValue) {
			self.frame = CGRect(x: newValue.x, y: newValue.y, width: self.frame.size.width, height: self.frame.size.height)
		}
	}

	public var width: CGFloat {
		get {
			return self.frame.size.width
		}
		set(newValue) {
			self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: newValue, height: self.frame.size.height)
		}
	}

	public var height: CGFloat {
		get {
			return self.frame.size.height
		}
		set(newValue) {
			self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.size.width, height: newValue)
		}
	}

	public var size: CGSize {
		get {
			return self.frame.size
		}

		set(newValue) {
			self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: newValue.width, height: newValue.height)
		}
	}
}

extension UIView {
	public var cornerRadius: CGFloat {
		get {
			return self.layer.cornerRadius
		}

		set(newValue) {
			self.layer.cornerRadius = newValue
		}
	}
	public var masksToBounds: Bool {
		get {
			return self.layer.masksToBounds
		}

		set(newValue) {
			self.layer.masksToBounds = newValue
		}
	}
}
