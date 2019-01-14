//
//  ViewController.swift
//  Free2Move
//
//  Created by Ashish Maheshwari on 1/11/19.
//  Copyright © 2019 Ashish Maheshwari. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    let businessLayer = BusinessLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        businessLayer.getVehicles(success: { (vehicles) in
            print(vehicles)
        }, failure: { (error) in
            print(error)
        })
    }
}

