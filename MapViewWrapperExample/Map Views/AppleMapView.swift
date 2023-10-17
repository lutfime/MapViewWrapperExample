//
//  AppleMapView.swift
//  MapViewWrapperExample
//
//  Created by Wan Ahmad Lutfi on 15/10/2023.
//

import Foundation
import MapKit

public class AppleMapView: MapViewWrapper{
    let mapView = MKMapView(frame: .zero)
    
    public func view() -> UIView{
        return mapView
    }
    
    public func setCenterCoordinate(coordinate: CLLocationCoordinate2D, zoomLevel: CGFloat, animated: Bool) {
        mapView.setCenter(coordinate, animated: animated)
        let zoomDistance = CLLocationDistance(exactly: 20000/zoomLevel)!
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: zoomDistance, longitudinalMeters: zoomDistance)
        mapView.setRegion(region, animated: animated)
    }
    
    public func addAnnotation(identifier: String, coordinate: CLLocationCoordinate2D) {
        if let annotation = (mapView.annotations as? [MapAnnotation])?.first(where: {$0.identifier == identifier}){
            annotation.coordinate = coordinate
            mapView.removeAnnotation(annotation)
            mapView.addAnnotation(annotation)
        }else{
            let annotation = MapAnnotation(identifier: identifier, coordinate: coordinate)
            mapView.addAnnotation(annotation)
        }
    }
}

class MapAnnotation: NSObject, MKAnnotation{
    var coordinate: CLLocationCoordinate2D
    let identifier: String
    
    init(identifier:String, coordinate: CLLocationCoordinate2D) {
        self.identifier = identifier
        self.coordinate = coordinate
    }
}
