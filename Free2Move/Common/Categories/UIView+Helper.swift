//
//  UIView+Heloer.swift
//  Free2Move
//
//  Created by Ashish Maheshwari on 1/18/19.
//  Copyright © 2019 Ashish Maheshwari. All rights reserved.
//

import UIKit

extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}
