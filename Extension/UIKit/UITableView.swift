//
//  UITableView.swift
//  swift_ui_util
//
//  Created by lxh on 2021/11/5.
//

import UIKit

extension UITableView {
	public func register(cellClass: AnyClass) {
		let cellId = NSStringFromClass(cellClass)
		self.register(cellClass, forCellReuseIdentifier: cellId)
	}

	public func dequeueReusableCell<T>(cellClass: T.Type, indexPath: IndexPath) -> T where T: UITableViewCell {
		let cellId = NSStringFromClass(cellClass)
		return self.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! T
	}
}
