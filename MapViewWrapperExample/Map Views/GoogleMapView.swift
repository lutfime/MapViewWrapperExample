//
//  GoogleMapView.swift
//  MapViewWrapperExample
//
//  Created by Wan Ahmad Lutfi on 15/10/2023.
//

import Foundation
import GoogleMaps

public class GoogleMapView: NSObject, MapViewWrapper, GMSMapViewDelegate{
    private let mapView = GMSMapView(frame: CGRect.zero)
    private var annotations = [GMSMarker]()
    
    public func view() -> UIView{
        return mapView
    }
    
    override init(){
        super.init()
        mapView.delegate = self
    }
    
    public func setCenterCoordinate(coordinate: CLLocationCoordinate2D, zoomLevel: CGFloat, animated: Bool) {
        let camera = GMSCameraPosition(latitude: coordinate.latitude, longitude: coordinate.longitude, zoom: Float(zoomLevel))
        if animated{
            mapView.animate(to: camera)
        }else{
            mapView.camera = camera
        }
    }
    
    public func addAnnotation(identifier: String, coordinate: CLLocationCoordinate2D) {
        if let annotation = annotations.first(where: {($0.userData as? String) == identifier}){
            annotation.position = coordinate
        }else{
            let annotation = GMSMarker(position: coordinate)
            annotation.groundAnchor = CGPoint(x: 0.5, y: 0.5)
            annotation.userData = identifier
            annotation.map = mapView
            annotations.append(annotation)
        }
    }
}
