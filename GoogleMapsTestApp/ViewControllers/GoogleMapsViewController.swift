//
//  ViewController.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 10.10.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class GoogleMapsViewController: UIViewController {

    @IBOutlet private weak var mapView: GMSMapView!
    @IBOutlet private weak var zoomInButton: UIButton!
    @IBOutlet private weak var zoomOutButton: UIButton!
    
    private var clusterManager: GMUClusterManager!
    private var clusterManagerFromNetwork: GMUClusterManager!
    private var renderer: GMUDefaultClusterRenderer!
    private var rendererFromNetwork: GMUDefaultClusterRenderer!
    private var mapMarker = GMSMarker()
    
    private var infoMarkerDidAdd = false
    private var currentZoom = StartPoint.zoom

    private let viewModel = GoogleMapsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupButtons()
        
    }

    private func setupView() {
        viewModel.setupMapView(mapView)
        
        (clusterManager, renderer) = viewModel.configureClusterManager(for: mapView)
        renderer.delegate = self
        clusterManager.setDelegate(self, mapDelegate: self)
        
        (clusterManagerFromNetwork, rendererFromNetwork) = viewModel.configureClusterManagerFromNetwork(for: mapView)
        rendererFromNetwork.delegate = self
        clusterManagerFromNetwork.setDelegate(self, mapDelegate: self)
        mapView.setNeedsDisplay()
    }
    
    private func setupButtons() {
        zoomInButton.layer.cornerRadius = 20
        zoomOutButton.layer.cornerRadius = 20
        
        zoomInButton.backgroundColor = .white
        zoomOutButton.backgroundColor = .white
    }
    
    private func changeMapZoom(action: MapZoomAction) {
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
        print("map delegate - didTap marker")
        
        removeInfoMarker()
        mapMarker = GMSMarker(position: mapPoint.position)
        switch mapPoint.category {
        case .human: mapMarker.icon = UIImage(named: "Body_selected")
        case .ufo: mapMarker.icon = UIImage(named: "Reproductive_selected")
        }
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
    
    func clusterManager(_ clusterManager: GMUClusterManager, didTap cluster: GMUCluster) -> Bool {
        let camera = GMSCameraPosition.camera(withTarget: cluster.position, zoom: mapView.camera.zoom + 1)
        mapView.animate(to: camera)
        currentZoom = mapView.camera.zoom
        return false
    }

}

extension GoogleMapsViewController: GMUClusterRendererDelegate {
    func renderer(_ renderer: GMUClusterRenderer, willRenderMarker marker: GMSMarker) {
        guard let mapPoint = marker.userData as? MapItem else {
            return
        }
        switch mapPoint.category {
        case .human: marker.icon = UIImage(named: "Body")
        case .ufo: marker.icon = UIImage(named: "Reproductive")
        }
    }
}
