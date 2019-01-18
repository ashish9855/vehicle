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
import SnapKit

class HomeViewControllerRootView: UIView {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var detailView: UIView!

    var mapLoadedOnce: Bool = false
    var vehicles: [Vehicle] = []
    var annotations:[MKPointAnnotation] = []

    func addDetailView(view: UIView) {
        detailView.addSubview(view)
        view.snp.makeConstraints { $0.edges.equalTo(0) }
    }
    
    func handle(oldVehicles: [Vehicle], newVehicles: [Vehicle], oldAnotations:[MKPointAnnotation]) -> (vehicles: [Vehicle], anotations: [MKPointAnnotation]) {
        
        // if we dont have vehicles already
        guard !oldVehicles.isEmpty else {
            let newAnotations = convertCoordinatesToAnnotations(for: newVehicles)
            addAnotationsOnMap(newAnotations)
            return (vehicles: newVehicles, anotations: newAnotations)
        }
        
        // find common vehickes between latest vehicles and old ones
        let commonVehicles = self.commonVehicles(between: oldVehicles, and: newVehicles)
        
        // find remaing old vehicles after removing common ones
        let remainingOldVehicles = self.leftVehicles(in: oldVehicles, after: commonVehicles)
        
        // find remaing new vehicles after removing common ones
        let remainingNewVehicles = self.leftVehicles(in: newVehicles, after: commonVehicles)

        // remove old anotations of vehicles which are not there in new ones
        let annotationsToBeRemoved = getAnotations(in: oldAnotations, of: remainingOldVehicles)
        
        // remove anotations
        removeAnotationsFromMap(annotationsToBeRemoved)
        let leftAnotations = removeAnotations(annotationsToBeRemoved, from: oldAnotations)
        
        // new vehicles anotations to be added
        let newAnotations = convertCoordinatesToAnnotations(for: remainingNewVehicles)
        addAnotationsOnMap(newAnotations)
        
        // final vehicles in the list
        let finalVehicles = commonVehicles + remainingNewVehicles
        let finalAnotations = newAnotations + leftAnotations
        
        return (vehicles: finalVehicles, anotations: finalAnotations)
    }
    
    func addAnotationsOnMap(_ anotations: [MKPointAnnotation]) {
        mapView.addAnnotations(anotations)
    }
    
    func removeAnotationsFromMap(_ anotations: [MKPointAnnotation]) {
        for anotation in anotations {
            mapView.removeAnnotation(anotation)
        }
    }
    
    func removeAnotations(_ anotations: [MKPointAnnotation], from old: [MKPointAnnotation]) -> [MKPointAnnotation] {
        var oldAnotation = old
        for anotation in anotations {
            if let index = oldAnotation.index(where: { $0.title == anotation.title }), index < old.count {
                oldAnotation.remove(at: index)
            }
        }
        return oldAnotation
    }
    
    func commonVehicles(between old: [Vehicle], and new: [Vehicle]) -> [Vehicle] {
        return new.filter { old.contains($0) }
    }
    
    func leftVehicles(in vehicles: [Vehicle], after common: [Vehicle]) -> [Vehicle] {
        return vehicles.filter{ !common.contains($0) }
    }
    
    func getAnotations(in anotations:[MKPointAnnotation], of vehicles: [Vehicle]) -> [MKPointAnnotation] {
        return anotations.filter { (anotation) -> Bool in
            return vehicles.contains(where: { $0.vin == anotation.title })
        }
    }

    func convertCoordinatesToAnnotations(for vehicles: [Vehicle]) -> [MKPointAnnotation] {
        var tempAnnotations:[MKPointAnnotation] = []
        for vehicle in vehicles {
            let annotation = getAnnotation(vehicle: vehicle)
            tempAnnotations.append(annotation)
        }
        return tempAnnotations
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
    
    func getAnnotation(vehicle: Vehicle) -> MKPointAnnotation {
        let annotation = MKPointAnnotation()
        let latitude = vehicle.position.latitutde
        let longitude = vehicle.position.longitude
        let coordinates = CLLocationCoordinate2D.init(latitude: latitude, longitude: longitude)
        annotation.title = vehicle.vin
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
        guard !mapLoadedOnce else {
            return
        }
        mapLoadedOnce = true
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
