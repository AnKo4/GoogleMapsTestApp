//
//  MapViewControllerViewModel.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 31.10.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol  MapViewControllerViewModel {
    func setupMapView(_ mapView: GMSMapView)
    func configureClusterManager(for mapView: GMSMapView) -> (GMUClusterManager, GMUDefaultClusterRenderer)
    func configureClusterManagerFromNetwork(for mapView: GMSMapView) -> (GMUClusterManager, GMUDefaultClusterRenderer)
    
}
