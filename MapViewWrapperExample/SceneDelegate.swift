//
//  SceneDelegate.swift
//  MapViewWrapperExample
//
//  Created by Wan Ahmad Lutfi on 15/10/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let mapView = AppleMapView()
//        let mapView = GoogleMapView() //Uncomment to use google map view (You need to setup key in AppDelegate!)
//        let mapView = FakeMapView() //Uncomment to use fake map view

        window!.rootViewController = LocationViewController(mapViewWrapper: mapView)
        window!.makeKeyAndVisible()
    }

}

