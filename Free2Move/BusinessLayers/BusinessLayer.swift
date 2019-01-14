//
//  BusinessLayer.swift
//  Free2Move
//
//  Created by Ashish Maheshwari on 1/13/19.
//  Copyright © 2019 Ashish Maheshwari. All rights reserved.
//

import Foundation

class BusinessLayer {
    
    let requestExecuter = RequestExecutor()
    
    struct API {
        static let baseUrl = "https://vehicle-challenge.carjump.net"
    }

    func getVehicles(success: @escaping (_ vehicles: Vehicles) -> Void, failure: @escaping (_ error: APIError) -> Void) {
        let resource = Vehicles.resource(url: API.baseUrl) { (parser) in
            if let error = parser.error {
                failure(error)
                return
            }
            if let json = parser.json {
                success(Vehicles(json))
                return
            }
        }
        requestExecuter.execute(resource)
    }
}
