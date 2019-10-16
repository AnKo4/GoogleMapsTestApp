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
    @IBOutlet private weak var zoomInButton: UIButton!
    @IBOutlet private weak var zoomOutButton: UIButton!
    
    private var clusterManager: GMUClusterManager!
    private let clusterItemGenerator = ClusterItemGenerator()
    private var mapMarker = GMSMarker()
    
    private var infoMarkerDidAdd = false
    var currentZoom = Float()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupClusterManager()
        setupMapView()
        setupButtons()        
    }

    private func setupMapView() {
        let location = CLLocationCoordinate2D(latitude: StartPoint.lat, longitude: StartPoint.long)
        mapView.camera = GMSCameraPosition.camera(withTarget: location, zoom: StartPoint.zoom)
        currentZoom = StartPoint.zoom
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
    
    private func setupButtons() {
        zoomInButton.layer.cornerRadius = 20
        zoomOutButton.layer.cornerRadius = 20
        
        zoomInButton.backgroundColor = .white
        zoomOutButton.backgroundColor = .white
    }
    
    private func changeMapZoom(action: MapZoom) {
        mapMarker.map = nil
        removeInfoMarker()
        let zoom = mapView.camera.zoom
        switch action {
        case .zoomIn:
            mapView.animate(toZoom: zoom + 1)
            currentZoom = zoom + 1
        case .zoomOut: mapView.animate(toZoom: zoom - 1)
            currentZoom = zoom - 1
        }
    }
    
    private func removeInfoMarker() {
        if infoMarkerDidAdd {
            print("removing marker")
            mapMarker.map = nil
            infoMarkerDidAdd = false
        }
    }
    
    @IBAction private func zoomInButtonTapped(_ sender: UIButton) {
        changeMapZoom(action: .zoomIn)
    }
    
    @IBAction private func zoomOutButtonTapped(_ sender: UIButton) {
        changeMapZoom(action: .zoomOut)
    }
    
}

extension GoogleMapsViewController: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        guard let mapPoint = marker.userData as? MapItem else {
            return false
        }
        print("map delegate")
        
        removeInfoMarker()
        mapMarker = GMSMarker(position: mapPoint.position)
        mapMarker.title = mapPoint.name
        mapMarker.snippet = mapPoint.snippet
        mapMarker.map = mapView
        infoMarkerDidAdd = true
        return false
    }
    
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        print("camera didChangePosition")
        if position.zoom != currentZoom {
            removeInfoMarker()
            currentZoom = position.zoom
        }
    }
    
}

extension GoogleMapsViewController: GMUClusterManagerDelegate {
    
//    func clusterManager(_ clusterManager: GMUClusterManager, didTap clusterItem: GMUClusterItem) -> Bool {
//        let camera = GMSCameraPosition.camera(withTarget: clusterItem.position, zoom: mapView.camera.zoom)
//        let update = GMSCameraUpdate.setCamera(camera)
//        mapView.moveCamera(update)
//        return false
//    }
    
    func clusterManager(_ clusterManager: GMUClusterManager, didTap cluster: GMUCluster) -> Bool {
        let camera = GMSCameraPosition.camera(withTarget: cluster.position, zoom: mapView.camera.zoom + 1)
        currentZoom = mapView.camera.zoom + 1
        mapView.animate(to: camera)
        print("cluster delegate")
        return false
    }

}

