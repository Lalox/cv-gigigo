//
//  GGMapViewController.swift
//  cv-gigigo
//
//  Created by Eduardo Miñon on 11/03/18.
//  Copyright © 2018 Eduardo Miñon. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps

class GGMapViewController: UIViewController {
    
    override func loadView(){
        let camera = GMSCameraPosition.camera(withLatitude: 19.401530, longitude: -99.138848, zoom: 11.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        view = mapView
        
        // Creates a marker in the center of the map.
        let inbursa = GMSMarker()
        inbursa.position = CLLocationCoordinate2D(latitude: 19.297991, longitude: -99.184280)
        inbursa.title = "1. Grupo Financiero Inbursa"
        inbursa.snippet = "Desarrollador Java"
        inbursa.map = mapView
        
        let stefanini = GMSMarker()
        stefanini.position = CLLocationCoordinate2D(latitude: 19.441320, longitude: -99.198778)
        stefanini.title = "2. Stefanini IT Solutions"
        stefanini.snippet = "Desarrollador Java/iOS/Android"
        stefanini.map = mapView
        
        let planetMedia = GMSMarker()
        planetMedia.position = CLLocationCoordinate2D(latitude: 19.429872, longitude: -99.214872)
        planetMedia.title = "3. Planet Media México"
        planetMedia.snippet = "Desarrollador iOS"
        planetMedia.map = mapView
        
        let hhSoftware = GMSMarker()
        hhSoftware.position = CLLocationCoordinate2D(latitude: 19.466878, longitude: -99.187851)
        hhSoftware.title = "4. 2H Software"
        hhSoftware.snippet = "Desarrollador iOS/Java/Go"
        hhSoftware.map = mapView
    }
}
