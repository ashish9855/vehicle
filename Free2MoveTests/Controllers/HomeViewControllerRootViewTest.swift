//
//  HomeViewControllerRootViewTest.swift
//  Free2MoveTests
//
//  Created by Ashish Maheshwari on 1/17/19.
//  Copyright © 2019 Ashish Maheshwari. All rights reserved.
//

import XCTest
import SwiftyJSON
import MapKit
@testable import Free2Move

class HomeViewControllerRootViewTest: XCTestCase {

    var oldVehicles: Vehicles?
    var newVehicles: Vehicles?
    let homeRootView = HomeViewControllerRootView()

    override func setUp() {
        super.setUp()
        oldVehicles = Vehicles(JSON(fileName: "VehiclesOld.json"))
        newVehicles = Vehicles(JSON(fileName: "VehiclesNew.json"))
    }
    
    func testGetAnotation_WhenVehicleObjectPassed() {
        guard let vehicle = oldVehicles?.vehicles[0] else { return }
        let anotation = homeRootView.getAnnotation(vehicle: vehicle)
        XCTAssertEqual(vehicle.position.latitutde, anotation.coordinate.latitude)
        XCTAssertEqual(vehicle.position.longitude, anotation.coordinate.longitude)
        XCTAssertEqual(vehicle.vin, anotation.title)
    }
    
    func testConvertCoordinatesToAnnotations_WhenVehicleObjectPassed_ThenConvertToAnotation() {
        guard let vehicle = oldVehicles?.vehicles[1] else { return }
        let anotation = homeRootView.convertCoordinatesToAnnotations(for: [vehicle])
        let object = anotation[0]
        XCTAssertEqual(vehicle.position.latitutde, object.coordinate.latitude)
        XCTAssertEqual(vehicle.position.longitude, object.coordinate.longitude)
        XCTAssertEqual(vehicle.vin, object.title)
    }
    
    func testCommonVehicles_WhenOldAndNewReceivedVehiclesPassed_ThenReturnCommon() {
        let old = oldVehicles?.vehicles ?? []
        let new = newVehicles?.vehicles ?? []
        let commonVehicles = homeRootView.commonVehicles(between: old, and: new)
        XCTAssertEqual(commonVehicles.count, 1)
    }
    
    func testLeftVehicles_WhenCommonAndAllVehiclesPassed_ThenReturnLeftOnes() {
        let old = oldVehicles?.vehicles ?? []
        let new = newVehicles?.vehicles ?? []
        let commonVehicles = homeRootView.commonVehicles(between: old, and: new)
        let leftVehicles = homeRootView.leftVehicles(in: old, after: commonVehicles)
        XCTAssertEqual(leftVehicles.count, 2)
    }
    
    func testGetAnotations_WhenVehiclesAndAnotationsPassed_ThenReturnAnotationsThatMatchesVehicles() {
        let old = oldVehicles?.vehicles ?? []
        
        let annotation = MKPointAnnotation()
        let latitude = CLLocationDegrees(52.30758365322011)
        let longitude = CLLocationDegrees(13.360824981446907)
        let coordinates = CLLocationCoordinate2D.init(latitude: latitude, longitude: longitude)
        annotation.title = "cRgbshhbfSwc1"
        annotation.coordinate = coordinates
       
        let vehicles = homeRootView.getAnotations(in: [annotation], of: old)
        XCTAssertEqual(vehicles.count, 1)
    }
}
