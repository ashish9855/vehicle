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
    @IBOutlet weak var heightConstraintaForCollectionView: NSLayoutConstraint!
    
    private let cellHeight = CGFloat(50)
    private let identifier = "infoCell"
    var presentationModel: VehicleViewPresentationModel!
    
    func setup(presentationModel: VehicleViewPresentationModel) {
        self.presentationModel = presentationModel
        let rows = getTotalRows(items: presentationModel.formData())
        heightConstraintaForCollectionView.constant = CGFloat(rows * 50)
        self.collectionView.register(UINib(nibName: "VehicleInfoCell", bundle: nil), forCellWithReuseIdentifier: identifier)
    }
    
    func getTotalRows(items: [VehicleViewPresentationModel.Item]) -> Int {
        let numberOfRows = items.count / 2
        let oneMoreRow = items.count % 2 == 0 ? 0 : 1
        return oneMoreRow + numberOfRows
    }
}

extension VehicleView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presentationModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : VehicleInfoCell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! VehicleInfoCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = CGFloat(self.frame.size.width / 2)
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
