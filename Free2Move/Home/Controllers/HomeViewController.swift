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
        getVehicles()
    }
    
    func getVehicles() {
        businessLayer.getVehicles(success: {[weak self] (vehicles) in
            guard let `self` = self else { return }
            self.rootView.stopLoading()
            self.handleVehicles(vehicles.vehicles)
            self.fireTimer()
            }, failure: { (error) in
                print(error)
                self.rootView.stopLoading()
                self.fireTimer()
            })
    }
    
    func fireTimer() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
            self.getVehicles()
        }
    }
    
    func handleVehicles(_ vehicles: [Vehicle]) {
        let oldVehicles = self.rootView.vehicles
        let oldAnotations = self.rootView.annotations
        let (finalVehicles, finalAnotations) = self.rootView.handle(oldVehicles: oldVehicles, newVehicles: vehicles, oldAnotations: oldAnotations)
        self.rootView.vehicles = finalVehicles
        self.rootView.annotations = finalAnotations
        self.rootView.zoomMap()
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

