//
//  VehicleViewPresentationModel.swift
//  Free2Move
//
//  Created by Ashish Maheshwari on 1/18/19.
//  Copyright © 2019 Ashish Maheshwari. All rights reserved.
//

import Foundation

struct VehicleViewPresentationModel {
   
    struct Item {
        let key: String
        let value: String
    }
    
    let vehicle: Vehicle
    var count: Int {
        return formData().count
    }
    var items: [Item] {
        return formData()
    }
    
    private func formData() -> [Item] {
        var items: [Item?] = []
        items.append(isAutomatic())
        items.append(color())
        items.append(engineType())
        items.append(fuelState())
        return items.compactMap({ $0 })
    }
    
    private func isAutomatic() -> Item? {
        if vehicle.automatic {
            return Item(key: "Transmission: ", value: "automatic")
        }
        return nil
    }
    
    private func color() -> Item? {
        if !vehicle.color.isEmpty {
            return Item(key: "Color: ", value: vehicle.color)
        }
        return nil
    }
    
    private func engineType() -> Item? {
        if vehicle.engineType != .generic {
           return Item(key: "Engine: ", value: vehicle.engineType.rawValue)
        }
        return nil
    }
    
    private func fuelState() -> Item? {
        if vehicle.fuelState != 0 {
            return Item(key: "Fuel: ", value: String(vehicle.fuelState) + "%")
        }
        return nil
    }
}
