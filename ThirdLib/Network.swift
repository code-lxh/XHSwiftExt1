//
//  Network.swift
//  swift_ui_util
//
//  Created by lxh on 2021/12/7.
//

import Foundation
import Alamofire

typealias URLAPI = String

struct HttpURL {
	static let baseUrl: URLAPI = "http://localhost:8080"
}

extension HttpURL {
	static let testAPI: URLAPI = baseUrl + "/test"
}

struct Network {
	static func POST<T>(_ url:String, paramter:Jsonable? = nil, timeout: TimeInterval = 10, header:[String: String]? = nil,
						completionHandler: @escaping (Result<T, Error>)->Void) -> Void where T: Jsonable{
		var httpHs: HTTPHeaders?
		if header != nil {
			httpHs = HTTPHeaders(header!)
		}
		
		let request = AF.request(url, method: .post,
								 parameters: paramter?.dict,
								 encoding: JSONEncoding.default,
								 headers: httpHs,
								 interceptor: nil)  { req in
			req.timeoutInterval = timeout
		}
		
		request.response { response in
			switch (response.result) {
			case .success(let data):
				let t: T? = T.json(data)
				if t != nil {
					completionHandler(Result.success(t!))
				} else {
					let err = MyErr.JsonParseErr
					completionHandler(Result.failure(err))
				}
			case .failure(let err):
				completionHandler(Result.failure(err))
			}
		}
	}
}

