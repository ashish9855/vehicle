//
//  Resource.swift
//  Free2Move
//
//  Created by Ashish Maheshwari on 1/13/19.
//  Copyright © 2019 Ashish Maheshwari. All rights reserved.
//

import Foundation
import Alamofire

struct Resource {
    
    typealias Parser = (_ parser: ResponseParser) -> Void
    var parser: Parser
    let url: URL?
    let method: HTTPMethod
    let headers: HTTPHeaders

    init(url: String, path: String = "", method: HTTPMethod, parameters: Parameters? = nil, headers: HTTPHeaders = [:], parser: @escaping (_ parser: ResponseParser) -> Void) {
        self.url = Resource.makeURL(url, path)
        self.parser = parser
        self.method = method
        self.headers = headers
    }
    
    private static func makeURL(_ url: String, _ path: String) -> URL? {
        var urlComponents = URLComponents(string: url)
        urlComponents?.path += path
        return urlComponents?.url
    }
}
