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
    
    let request: URLRequest

    init (_ request: URLRequest) {
        self.request = request
    }
    
    func execute(with completionHandler:  @escaping (_ parser: ResponseParser) -> Void) {
        Alamofire.request(request).responseData { data in
            completionHandler(self.parser(data))
        }
    }
    
    private func parser(_ response: DataResponse<Data>) -> ResponseParser {
        let parse = ResponseParser(data: response)
        return parse
    }
}

