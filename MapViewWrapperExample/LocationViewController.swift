//
//  LocationViewController.swift
//  MapViewWrapperExample
//
//  Created by Wan Ahmad Lutfi on 16/10/2023.
//

import UIKit
import CoreLocation

public class LocationViewController: UIViewController{
    private let mapViewWrapper: MapViewWrapper
    private var mapView: UIView{
        return mapViewWrapper.view()
    }
    
    public init(mapViewWrapper: MapViewWrapper) {
        self.mapViewWrapper = mapViewWrapper
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        showLocation(CLLocationCoordinate2D(latitude: 3.1386, longitude: 101.6044))
    }
    
    private func setupView(){
        mapView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mapView)
        setupConstraints()
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            mapView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            mapView.topAnchor.constraint(equalTo: self.view.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
        ])
    }
    
    public func showLocation(_ coordinate: CLLocationCoordinate2D){
        mapViewWrapper.setCenterCoordinate(
            coordinate: coordinate,
            zoomLevel: 15,
            animated: true)
        mapViewWrapper.addAnnotation(identifier: "location", coordinate: coordinate)

    }
}
