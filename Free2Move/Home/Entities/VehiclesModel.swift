//
//  VehiclesModel.swift
//  Free2Move
//
//  Created by Ashish Maheshwari on 1/12/19.
//  Copyright © 2019 Ashish Maheshwari. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

struct Vehicles {
    let vehicles: [Vehicle]
    
    init(_ json: JSON) {
        vehicles = json["vehicles"].arrayValue.map({ Vehicle($0) })
    }
}


extension Vehicles {
    
    static func resource(url: String, parser: @escaping (_ parser: ResponseParser) -> Void ) -> Resource {
        return Resource(url: url,
                        path: "/v1",
                        method: HTTPMethod.get,
                        parser: parser)
    }
}

