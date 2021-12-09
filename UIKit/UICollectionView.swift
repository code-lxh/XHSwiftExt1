//
//  UICollectionView.swift
//  swift_ui_util
//
//  Created by lxh on 2021/11/11.
//

import UIKit

extension UICollectionView {
	public func register(cellClass: AnyClass) {
		let cellID = NSStringFromClass(cellClass)
		self.register(cellClass, forCellWithReuseIdentifier: cellID)
	}

	public func dequeueReusableCell<T>(cellClass: T.Type, indexPath: IndexPath) -> T where T: UICollectionViewCell {
		let cellID = NSStringFromClass(cellClass.self)
		return self.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! T
	}
}
