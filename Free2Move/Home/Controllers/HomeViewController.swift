//
//  ViewController.swift
//  Free2Move
//
//  Created by Ashish Maheshwari on 1/11/19.
//  Copyright © 2019 Ashish Maheshwari. All rights reserved.
//

import UIKit
import MapKit

class HomeViewController: UIViewController, RootViewProtocol {

    typealias TypeRootView = HomeViewControllerRootView
    
    let businessLayer = BusinessLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.rootView.startLoading()
        businessLayer.getVehicles(success: {[weak self] (vehicles) in
            self?.rootView.stopLoading()
            self?.rootView.vehicles = vehicles.vehicles
            self?.rootView.convertCoordinatesToAnnotations(for: vehicles.vehicles)
            self?.rootView.zoomMap()
            self?.rootView.addAllAnotations()
        }, failure: { (error) in
            print(error)
            self.rootView.stopLoading()

        })
    }
}

extension HomeViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        var pinView: MKPinAnnotationView?
        let defaultPinID = "myAnnotation"
        
        pinView = mapView.dequeueReusableAnnotationView(withIdentifier: defaultPinID) as? MKPinAnnotationView
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: defaultPinID)
            pinView!.canShowCallout = true
        }
        else {
            pinView!.annotation = annotation
        }
        return pinView
    }
}

