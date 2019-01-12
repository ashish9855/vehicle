//
//  VehicleModel.swift
//  Free2Move
//
//  Created by Ashish Maheshwari on 1/12/19.
//  Copyright © 2019 Ashish Maheshwari. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Vehicle {
    let provider: String
    let manufacturer: String
    let model: String
    let sign: String
    let vin: String
    let fuelState: Int
    let engineType: String
    let automatic: Bool
    let color: String
    let position: Position
    
    init(_ json: JSON) {
        provider = json["provider"].stringValue
        manufacturer = json["manufacturer"].stringValue
        model = json["model"].stringValue
        sign = json["sign"].stringValue
        vin = json["vin"].stringValue
        fuelState = json["fuel_state"].intValue
        engineType = json["engine_type"].stringValue
        automatic = json["automatic"].boolValue
        color = json["color"].stringValue
        position = Position(json["position"])
    }
}
