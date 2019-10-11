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
        clusterManager.setDelegate(self, mapDelegate: self)
    }
    
}

extension GoogleMapsViewController: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        guard let mapPoint = marker.userData as? MapItem else {
            let mapMarker = GMSMarker()
            mapMarker.map = mapView
            return false
        }
        let mapMarker = GMSMarker(position: mapPoint.position)
        mapMarker.title = mapPoint.name
        mapMarker.snippet = mapPoint.snippet
        mapMarker.map = mapView
        return false
    }
    
}

extension GoogleMapsViewController: GMUClusterManagerDelegate {
    
    func clusterManager(_ clusterManager: GMUClusterManager, didTap clusterItem: GMUClusterItem) -> Bool {
        let camera = GMSCameraPosition.camera(withTarget: clusterItem.position, zoom: mapView.camera.zoom)
        let update = GMSCameraUpdate.setCamera(camera)
        mapView.moveCamera(update)
        return false
    }
    
    func clusterManager(_ clusterManager: GMUClusterManager, didTap cluster: GMUCluster) -> Bool {
        let camera = GMSCameraPosition.camera(withTarget: cluster.position, zoom: mapView.camera.zoom + 1)
        let update = GMSCameraUpdate.setCamera(camera)
        mapView.moveCamera(update)
        return false
    }

}

