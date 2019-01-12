//
//  File.swift
//  Free2MoveTests
//
//  Created by Ashish Maheshwari on 1/12/19.
//  Copyright © 2019 Ashish Maheshwari. All rights reserved.
//

import Foundation
@testable import Free2Move

typealias JSONDictionary = [String: Any]

class TestContentProvider {
   
    static func contentsOfFile(_ fileName: String) -> JSONDictionary{
        let components = fileName.components(separatedBy: ".")
        let name = components.first!
        let fileExtension = components.last!
        let path = Bundle.main.path(forResource: name, ofType: fileExtension)
        let data = try! NSData(contentsOfFile: path!, options:.mappedIfSafe) as Data
        let result = try! JSONSerialization.jsonObject(with: data as Data, options: .mutableContainers)
        return result as! JSONDictionary
    }
}
