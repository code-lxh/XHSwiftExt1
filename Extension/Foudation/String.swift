//
//  File.swift
//  swift_ui_util
//
//  Created by lxh on 2021/11/16.
//

import Foundation

extension String {

	/// string -> AnyClass
	///
	/// let claName = "ViewControllerName"
	/// let cls = claName.convertToClass() as! UIViewController.Type
	/// let vc = cls.init()
	/// // some other code
	///
	/// - Returns: AnyClass
	public func convertToClass() -> AnyClass? {

		let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
		let cls: AnyClass? = NSClassFromString("\(namespace).\(self)")

		return cls
	}

}
