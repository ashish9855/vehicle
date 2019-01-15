//
//  RootViewProtocol.swift
//  Free2Move
//
//  Created by Ashish Maheshwari on 1/15/19.
//  Copyright © 2019 Ashish Maheshwari. All rights reserved.
//

import Foundation
import UIKit

protocol RootViewProtocol {
    associatedtype TypeRootView
}

extension RootViewProtocol where Self: UIViewController {
    var rootView: TypeRootView {
        return self.view as! TypeRootView
    }
}
