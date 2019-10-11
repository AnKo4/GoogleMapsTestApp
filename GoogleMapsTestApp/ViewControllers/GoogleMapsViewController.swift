//
//  ViewController.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 10.10.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit
import GoogleMaps

class GoogleMapsViewController: UIViewController {

    @IBOutlet private weak var mapView: GMSMapView!
    private var clusterManager: GMUClusterManager!
    
    private let clusterItemGenerator = ClusterItemGenerator()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupClusterManager()
    }

    private func setupClusterManager() {
        let iconGenerator = GMUDefaultClusterIconGenerator()
        let algorithm = GMUNonHierarchicalDistanceBasedAlgorithm()
        let renderer = GMUDefaultClusterRenderer(mapView: mapView, clusterIconGenerator: iconGenerator)
        
        clusterManager = GMUClusterManager(map: mapView, algorithm: algorithm, renderer: renderer)
        
        clusterItemGenerator.prepareItems(clusterManager: clusterManager)
        
        clusterManager.cluster()
    }
    
}

extension GoogleMapsViewController: GMSMapViewDelegate {
    
}

extension GoogleMapsViewController: GMUClusterManagerDelegate {
    
}

