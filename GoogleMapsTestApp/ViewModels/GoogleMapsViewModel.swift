//
//  GoogleMapsViewModel.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 28.10.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation
import GoogleMaps

struct GoogleMapsViewModel {
    
    private let clusterItemGenerator = ClusterItemGenerator()
    
    
    func setupMapView(_ mapView: GMSMapView ) {
        let location = CLLocationCoordinate2D(latitude: StartPoint.lat, longitude: StartPoint.long)
        mapView.camera = GMSCameraPosition.camera(withTarget: location, zoom: StartPoint.zoom)
    }

    func generateClusterManager(for mapView: GMSMapView) -> (GMUClusterManager, GMUDefaultClusterRenderer) {
        let iconGenerator = GMUDefaultClusterIconGenerator(buckets: [4, 5, 6, 8, 10], backgroundColors: [.gray, .green, .blue, .cyan, .red])
        let algorithm = GMUNonHierarchicalDistanceBasedAlgorithm()
        let renderer = GMUDefaultClusterRenderer(mapView: mapView, clusterIconGenerator: iconGenerator)
        
        let clusterManager = GMUClusterManager(map: mapView, algorithm: algorithm, renderer: renderer)
        
        clusterItemGenerator.prepareItems(clusterManager: clusterManager)
        clusterManager.cluster()
        
        return (clusterManager, renderer)
    }
    
}
