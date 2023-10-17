//
//  MapViewWrapper.swift
//  MapViewWrapperExample
//
//  Created by Wan Ahmad Lutfi on 15/10/2023.
//

import UIKit
import CoreLocation

public protocol MapViewWrapper{
    func view() -> UIView
    func setCenterCoordinate(coordinate: CLLocationCoordinate2D, zoomLevel: CGFloat, animated: Bool)
    func addAnnotation(identifier: String, coordinate: CLLocationCoordinate2D)
}
