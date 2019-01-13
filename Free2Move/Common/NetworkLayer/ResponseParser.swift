//
//  ResponseParser.swift
//  Free2Move
//
//  Created by Ashish Maheshwari on 1/13/19.
//  Copyright © 2019 Ashish Maheshwari. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class ResponseParser {
    
    var error: APIError?
    var json: JSON?

    init(data: DataResponse<Data>) {
        guard data.error == nil else {
            if let code = HTTPStatusCode(rawValue: data.response?.statusCode ?? 0) {
                error = APIError.HTTPError(statusCode: code)
            }
            return
        }
        
        guard let response = data.data else {
            error = APIError.ServerError
            return
        }
        
        // Parsing
        do {
            self.json = try JSON(data: response)
        } catch {
            // couldn't parse JSON
            // Check for String response
            let textResponse = String(data: response, encoding: String.Encoding.utf8) ?? ""
            guard !textResponse.isEmpty else {
                self.error = APIError.JsonParserError
                return
            }
            self.json = JSON(stringLiteral: textResponse)
        }
    }
}
