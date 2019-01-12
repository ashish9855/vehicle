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
        
        let latitutde: String
        let longitude: String
        
        init(_ json: JSON) {
            latitutde = json["lat"].stringValue
            longitude = json["lng"].stringValue
        }
    }
}
