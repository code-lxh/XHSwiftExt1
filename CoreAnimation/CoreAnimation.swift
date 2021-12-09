//
//  CoreAnimation.swift
//  swift_ui_util
//
//  Created by lxh on 2021/11/9.
//

import Foundation
import QuartzCore
import UIKit

/// Core Animation的可动画属性
/// link: https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CoreAnimation_guide/AnimatableProperties/AnimatableProperties.html
extension CAAnimation {
	static let DefaultDuration: TimeInterval = 0.3

	class func contents(from: UIImage, to: UIImage, duration: TimeInterval = DefaultDuration) -> CAAnimation {
		return self.animation(keyPath: "contents", from: from.cgImage, to: to.cgImage, duration: duration)
	}

	/// contentsRect 默认值是 (0, 0, 1, 1)
	class func contentsRect(from: CGRect, to: CGRect, duration: TimeInterval = DefaultDuration) -> CAAnimation {
		return self.animation(keyPath: "contentsRect", from: from, to: to, duration: duration)
	}

	class func postion(from: CGPoint, to: CGPoint, duration: TimeInterval = DefaultDuration) -> CAAnimation {
		return self.animation(keyPath: "position", from: from, to: to, duration: duration)
	}

	class func opacity(from: CGFloat, to: CGFloat, duration: TimeInterval = DefaultDuration) -> CAAnimation {
		return self.animation(keyPath: "opacity", from: from, to: to, duration: duration)
	}

	class func cornerRadius(from: CGFloat, to: CGFloat, duration: TimeInterval = DefaultDuration) -> CAAnimation {
		return self.animation(keyPath: "cornerRadius", from: from, to: to, duration: duration)
	}

	class func borderWidth(from: CGFloat, to: CGFloat, duration: TimeInterval = DefaultDuration) -> CAAnimation {
		return self.animation(keyPath: "borderWidth", from: from, to: to, duration: duration)
	}

	class func borderColor(from: UIColor, to: UIColor, duration: TimeInterval = DefaultDuration) -> CAAnimation {
		return self.animation(keyPath: "borderColor", from: from.cgColor, to: to.cgColor, duration: duration)
	}

	class func animation(keyPath: String, from: Any?, to: Any?, duration: TimeInterval = DefaultDuration) -> CAAnimation {
		let animation = CABasicAnimation.init(keyPath: keyPath)
		animation.fromValue = from
		animation.toValue = to
		animation.duration = CFTimeInterval(duration)

		animation.isRemovedOnCompletion = false
		animation.fillMode = .forwards

		return animation
	}
}
