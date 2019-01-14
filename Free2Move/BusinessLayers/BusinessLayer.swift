//
//  BusinessLayer.swift
//  Free2Move
//
//  Created by Ashish Maheshwari on 1/13/19.
//  Copyright © 2019 Ashish Maheshwari. All rights reserved.
//

import Foundation

class BusinessLayer {
    
    struct API {
        static let baseUrl = "https://api.myjson.com"
    }

    func getVehicles() {
        let resource = Vehicles.resource(url: API.baseUrl) { (parser) in
            print(parser)
        }
        RequestExecutor.init(resource).execute()
    }
}
