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
    
    init(url: String, path: String = "", method: HTTPMethod, parameters: Parameters? = nil, headers: HTTPHeaders = [:], parser: @escaping (_ parser: ResponseParser) -> Void) {
        
        guard let url = Resource.makeURL(url, path) else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = headers
        let executer = RequestExecutor(urlRequest)
        executer.execute(with: parser)
    }
    
    private static func makeURL(_ url: String, _ path: String) -> URL? {
        var urlComponents = URLComponents(string: url)
        urlComponents?.path += path
        return urlComponents?.url
    }
}
