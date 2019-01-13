//
//  HttpStatusCode.swift
//  Free2Move
//
//  Created by Ashish Maheshwari on 1/13/19.
//  Copyright © 2019 Ashish Maheshwari. All rights reserved.
//

import Foundation

public enum HTTPStatusCode: Int {
    case badRequest = 400
    
    func description() -> String {
        switch self {
        case .badRequest:
            return "Bad request"
        }
    }
}
