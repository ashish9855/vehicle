//
//  VehicleView.swift
//  Free2Move
//
//  Created by Ashish Maheshwari on 1/15/19.
//  Copyright © 2019 Ashish Maheshwari. All rights reserved.
//

import UIKit

class VehicleView: UIView {

    @IBOutlet weak var modelName: UILabel!
    @IBOutlet weak var identificationNumber: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let cellWidth = CGFloat(self.frame.size.width / 2)
    private let cellHeight = CGFloat(50)
    private let identifier = "infoCell"
    var items: [String] = []
    
    func setup() {
        self.collectionView.register(UINib(nibName: "VehicleInfoCell", bundle: nil), forCellWithReuseIdentifier: identifier)
    }
}

extension VehicleView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : VehicleInfoCell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! VehicleInfoCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
