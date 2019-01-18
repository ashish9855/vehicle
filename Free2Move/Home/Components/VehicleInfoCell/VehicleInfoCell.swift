//
//  VehicleInfoCell.swift
//  Free2Move
//
//  Created by Ashish Maheshwari on 1/15/19.
//  Copyright © 2019 Ashish Maheshwari. All rights reserved.
//

import UIKit

class VehicleInfoCell: UICollectionViewCell {

    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set(_ title: String) {
        self.title.text = title
    }
}
