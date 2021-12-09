//
//  JsonConvert.swift
//  learning_swift
//
//  Created by lxh on 2021/9/29.
//

import Foundation

protocol Jsonable: Codable {
	/// 从数据中转换成 struct
	static func json(_ data: Data?) -> Self?
	static func json(_ str: String?) -> Self?
	
	/// struct 转换为 字典
	var dict:[String: Any] { get }
}

extension Jsonable {
	static func json(_ data: Data?) -> Self? {

		guard let data = data else {
			print("json error: data == nil")
			return nil
		}

		do {
			let obj = try JSONDecoder().decode(Self.self, from: data)
			return obj
		} catch {
			print("json error:", error)
			return nil
		}
	}

	static func json(_ str: String?) -> Self? {
		guard let str = str else {
			print("json error: str == nil")
			return nil
		}

		let data = str.data(using: .utf8)
		guard let data = data else {
			print("json error: data == nil")
			return nil
		}

		do {
			let obj = try JSONDecoder().decode(Self.self, from: data)
			return obj
		} catch {
			print("json error:", error)
			return nil
		}
	}
	
	var dict:[String: Any] {
		get {
			let data = try? JSONEncoder().encode(self)
			if data == nil {
				return Dictionary()
			}
			let dict = try? JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed)
			if dict == nil {
				return Dictionary()
			}
			
			return dict as! [String: Any]
		}
	}
	
}
