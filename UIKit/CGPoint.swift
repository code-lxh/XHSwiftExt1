//
//  CGPoint.swift
//  swift_ui_util
//
//  Created by lxh on 2021/11/30.
//

import UIKit

extension CGPoint {
	/// 两点之间的距离
	func distance(to otherPoint: CGPoint) -> CGFloat {
		let diffX = self.x - otherPoint.x
		let diffY = self.y - otherPoint.y
		
		return CGFloat(sqrt(diffX*diffX + diffY*diffY))
	}
}
