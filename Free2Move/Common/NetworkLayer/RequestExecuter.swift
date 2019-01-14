//
//  Network.swift
//  Free2Move
//
//  Created by Ashish Maheshwari on 1/13/19.
//  Copyright © 2019 Ashish Maheshwari. All rights reserved.
//

import Foundation
import Alamofire

class RequestExecutor {
    
    var resource: Resource!
    
    func execute(_ resource: Resource) {
        self.resource = resource
        guard let url = resource.url else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = resource.method.rawValue
        urlRequest.allHTTPHeaderFields = resource.headers
        Alamofire.request(urlRequest).responseData { [weak self] data in
            guard let `self` = self else { return }
            self.resource.parser(self.parser(data))
        }
    }
    
    private func parser(_ response: DataResponse<Data>) -> ResponseParser {
        let parse = ResponseParser(data: response)
        return parse
    }
}

