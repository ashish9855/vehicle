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
    
    enum EngineType: String {
        case petrol
        case hydrogen
        case diesel
        case electric
        case generic = ""
    }
    
    let provider: String
    let manufacturer: String
    let model: String
    let sign: String
    let vin: String
    let fuelState: Int
    let engineType: EngineType
    let automatic: Bool
    let color: String
    let imageUrl: String
    let position: Position
    
    init(_ json: JSON) {
        provider = json["provider"].stringValue
        manufacturer = json["manufacturer"].stringValue
        model = json["model"].stringValue
        sign = json["sign"].stringValue
        vin = json["vin"].stringValue
        fuelState = json["fuel_state"].intValue
        engineType = EngineType(rawValue: json["engine_type"].stringValue) ?? .generic
        automatic = json["automatic"].boolValue
        color = json["color"].stringValue
        imageUrl = json["image_url"].stringValue
        position = Position(json["position"])
    }
}

extension Vehicle: Equatable {
    static func ==(lhs: Vehicle, rhs: Vehicle) -> Bool {
        return lhs.vin == rhs.vin && lhs.position.latitutde == rhs.position.latitutde && lhs.position.longitude == rhs.position.longitude
    }
}
