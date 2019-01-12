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

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testItemsCount_WhenDataParsed() {
        XCTAssertEqual(vehicles?.vehicles.count, 2)
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
