//
//  UIScreen.swift
//  swift_ui_util
//
//  Created by lxh on 2021/11/5.
//

import UIKit

extension UIScreen {
	public class var width: CGFloat {
		get {
			return self.main.bounds.size.width
		}
	}

	public class var height: CGFloat {
		get {
			return self.main.bounds.size.height
		}
	}

}
