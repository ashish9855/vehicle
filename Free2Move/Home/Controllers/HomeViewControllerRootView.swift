//
//  HomeViewControllerRootView.swift
//  Free2Move
//
//  Created by Ashish Maheshwari on 1/15/19.
//  Copyright © 2019 Ashish Maheshwari. All rights reserved.
//

import UIKit
import MBProgressHUD
import MapKit

class HomeViewControllerRootView: UIView {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var vehicles: [Vehicle] = []
    var annotations:[MKPointAnnotation] = []
    
    func convertCoordinatesToAnnotations(for vehicles: [Vehicle]) {
        for vehicle in vehicles {
            let annotation = getAnnotation(vehicle: vehicle)
            annotations.append(annotation)
        }
    }
    
    func removeAllAnotations() {
        mapView.removeAnnotations(mapView.annotations)
    }
    
    func addAllAnotations() {
        if !annotations.isEmpty {
            removeAllAnotations()
            mapView.addAnnotations(annotations)
        }
    }
    
    private func getAnnotation(vehicle: Vehicle) -> MKPointAnnotation {
        let annotation = MKPointAnnotation()
        let latitude = vehicle.position.latitutde
        let longitude = vehicle.position.longitude
        let coordinates = CLLocationCoordinate2D.init(latitude: latitude, longitude: longitude)
        annotation.coordinate = coordinates
        return annotation
    }
    
    func startLoading() {
        MBProgressHUD.showAdded(to: self, animated: true)
    }
    
    func stopLoading() {
        MBProgressHUD.hide(for: self, animated: true)
    }
    
    func zoomMap() {
        guard let firstCoordinate = annotations.first?.coordinate else {
            return }
        let annotationPoint = MKMapPoint(firstCoordinate)
        var zoomRect =  MKMapRect(x: annotationPoint.x, y: annotationPoint.y, width: 0, height: 0)
        if let lastCoordinate = annotations.last?.coordinate {
            let lastAnnotationPoint = MKMapPoint(lastCoordinate)
            let pointLastRect = MKMapRect(x: lastAnnotationPoint.x, y: lastAnnotationPoint.y, width: 0, height: 0)
            zoomRect = zoomRect.union(pointLastRect)
        }
        
        mapView.setVisibleMapRect(zoomRect, animated: true)
    }
}
