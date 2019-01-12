//
//  SwiftyJSON+Helper.swift
//  Free2Move
//
//  Created by Ashish Maheshwari on 1/12/19.
//  Copyright © 2019 Ashish Maheshwari. All rights reserved.
//

import Foundation
import SwiftyJSON

extension JSON {
    
    init(fileName: String) {
        let fileContent = TestContentProvider.contentsOfFile(fileName)
        self.init(fileContent)
    }
}
