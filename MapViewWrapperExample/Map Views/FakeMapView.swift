//
//  FakeMapView.swift
//  MapViewWrapperExample
//
//  Created by Wan Ahmad Lutfi on 15/10/2023.
//

import UIKit
import CoreLocation

public class FakeMapView: MapViewWrapper{
    let mapView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        
        let label = UILabel()
        label.text = "This is a fake map view utilizing MapViewWrapper protocol"
        label.numberOfLines = 3
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: view.topAnchor),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        return view
    }()
    
    public func view() -> UIView{
        return mapView
    }
    
    public func setCenterCoordinate(coordinate: CLLocationCoordinate2D, zoomLevel: CGFloat, animated: Bool) {
        //Do nothing in fake map view
    }
    
    public func addAnnotation(identifier: String, coordinate: CLLocationCoordinate2D) {
        //Do nothing in fake map view
    }
}
