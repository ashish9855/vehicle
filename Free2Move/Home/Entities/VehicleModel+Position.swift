//
//  VehicleModel.Position.swift
//  Free2Move
//
//  Created by Ashish Maheshwari on 1/12/19.
//  Copyright © 2019 Ashish Maheshwari. All rights reserved.
//

import Foundation
import SwiftyJSON

extension Vehicle {
    
    struct Position {
        let latitutde: Double
        let longitude: Double

        init(_ json: JSON) {
            latitutde = json["lat"].doubleValue
            longitude = json["lng"].doubleValue
        }
    }
}
