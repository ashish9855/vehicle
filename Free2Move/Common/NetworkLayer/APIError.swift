//
//  APIError.swift
//  Free2Move
//
//  Created by Ashish Maheshwari on 1/13/19.
//  Copyright © 2019 Ashish Maheshwari. All rights reserved.
//

import Foundation

enum APIError {
    case NoInternet
    case HTTPError(statusCode: HTTPStatusCode)
    case ServerError
    case JsonParserError

    var description: String {
        switch self {
        case .NoInternet:
            return "There is no internet connection."
        case .HTTPError(let statusCode):
            return statusCode.description()
        case .ServerError:
            return "Server Error"
        case .JsonParserError:
            return "Json Parser Error"
        }
    }
}
