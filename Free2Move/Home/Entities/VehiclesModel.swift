//
//  VehiclesModel.swift
//  Free2Move
//
//  Created by Ashish Maheshwari on 1/12/19.
//  Copyright © 2019 Ashish Maheshwari. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Vehicles {
    let vehicles: [Vehicle]
    
    init(_ json: JSON) {
        vehicles = json["vehicles"].arrayValue.map({ Vehicle($0) })
    }
}
