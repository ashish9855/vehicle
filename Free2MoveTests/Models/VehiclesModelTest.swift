//
//  VehiclesModelTest.swift
//  Free2MoveTests
//
//  Created by Ashish Maheshwari on 1/12/19.
//  Copyright © 2019 Ashish Maheshwari. All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import Free2Move

class VehiclesModelTest: XCTestCase {

    var vehicles: Vehicles?
    
    override func setUp() {
        super.setUp()
        vehicles = Vehicles(JSON(fileName: "Vehicles.json"))
    }
    
    func testItemsCount_WhenDataParsed() {
        XCTAssertEqual(vehicles?.vehicles.count, 2)
    }
    
    func testVehicleData_WhenDataParsed() {
        let vehicle = vehicles?.vehicles[0]
        XCTAssertEqual(vehicle?.provider, "vehicle4go")
        XCTAssertEqual(vehicle?.manufacturer, "Mercedes-Benz")
        XCTAssertEqual(vehicle?.model, "Mercedes-Benz B-Klasse")
        XCTAssertEqual(vehicle?.sign, "i5q9KV")
        XCTAssertEqual(vehicle?.vin, "cRgbshhbfSwc")
        XCTAssertEqual(vehicle?.fuelState, 72)
        XCTAssertEqual(vehicle?.engineType, Vehicle.EngineType.electric)
        XCTAssertEqual(vehicle?.automatic, true)
        XCTAssertEqual(vehicle?.color, "laurus_grey")
        XCTAssertEqual(vehicle?.position.latitutde, 52.30758365322001)
        XCTAssertEqual(vehicle?.position.longitude, 13.360824981446907)
    }
    
    func testVehicleData_WhenDataIsNULL_ThenDefaultData() {
        let vehicle = vehicles?.vehicles[1]
        XCTAssertEqual(vehicle?.provider, "")
        XCTAssertEqual(vehicle?.manufacturer, "")
        XCTAssertEqual(vehicle?.model, "")
        XCTAssertEqual(vehicle?.sign, "")
        XCTAssertEqual(vehicle?.vin, "")
        XCTAssertEqual(vehicle?.fuelState, 0)
        XCTAssertEqual(vehicle?.engineType, Vehicle.EngineType.generic)
        XCTAssertEqual(vehicle?.automatic, false)
        XCTAssertEqual(vehicle?.color, "")
        XCTAssertEqual(vehicle?.position.latitutde, 0)
        XCTAssertEqual(vehicle?.position.longitude, 0)
    }
    
    
    func testEngineType_WhenNotOfDefinedType_ThenGenericType() {
        let vehicle = vehicles?.vehicles[1]
        XCTAssertEqual(vehicle?.engineType, Vehicle.EngineType.generic)
    }
}
