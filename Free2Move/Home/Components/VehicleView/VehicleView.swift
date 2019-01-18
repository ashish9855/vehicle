//
//  VehicleView.swift
//  Free2Move
//
//  Created by Ashish Maheshwari on 1/15/19.
//  Copyright © 2019 Ashish Maheshwari. All rights reserved.
//

import UIKit

class VehicleView: UIView {

    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var modelName: UILabel!
    @IBOutlet weak var identificationNumber: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var heightConstraintaForCollectionView: NSLayoutConstraint!
    
    private let cellHeight = CGFloat(50)
    private let identifier = "VehicleInfoCell"
    var presentationModel: VehicleViewPresentationModel!
    
    func setup(presentationModel: VehicleViewPresentationModel) {
        self.presentationModel = presentationModel
        self.collectionView.register(UINib(nibName: "VehicleInfoCell", bundle: nil), forCellWithReuseIdentifier: identifier)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        handleView()
    }
    
    private func handleView() {
        self.modelName.text = presentationModel.vehicle.model
        self.identificationNumber.text = presentationModel.vehicle.vin
        heightConstraintaForCollectionView.constant = CGFloat(presentationModel.count * Int(cellHeight))
        self.collectionView.reloadData()
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
        let item = presentationModel.items[indexPath.item]
        cell.set(item.key + item.value)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = CGFloat(self.frame.size.width - 20)
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
