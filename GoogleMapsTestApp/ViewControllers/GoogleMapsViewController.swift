//
//  ViewController.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 10.10.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class GoogleMapsViewController: GoogleMapViewController {
    var viewModel: MapViewControllerViewModel!
    

    @IBOutlet private weak var mapView: GMSMapView!
    @IBOutlet private weak var zoomInButton: UIButton!
    @IBOutlet private weak var zoomOutButton: UIButton!
    
    private var clusterManager: GMUClusterManager!
    private var clusterManagerFromNetwork: GMUClusterManager!
    private var renderer: GMUDefaultClusterRenderer!
    private var rendererFromNetwork: GMUDefaultClusterRenderer!
    private var selectedMarker: GMSMarker!
    
    private var markerDidSelected = false

//    var viewModel: GoogleMapsViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = GoogleMapsViewModel()
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
    }
    
    private func setupButtons() {
        zoomInButton.layer.cornerRadius = 20
        zoomOutButton.layer.cornerRadius = 20
        
        zoomInButton.backgroundColor = .white
        zoomOutButton.backgroundColor = .white
    }
    
    private func changeMapZoom(action: MapZoomAction) {
        let zoom = mapView.camera.zoom
        switch action {
        case .zoomIn: mapView.animate(toZoom: zoom + 1)
        case .zoomOut: mapView.animate(toZoom: zoom - 1)
        }
    }
    
    private func redrawMarker(_ marker: GMSMarker) {
        guard let markerInfo = marker.userData as? MapItem else {
            return
        }

        switch markerInfo.category {
        case .human: marker.icon = UIImage(named: "Body")
        case .ufo: marker.icon = UIImage(named: "Reproductive")
        }
        marker.title = nil
        marker.snippet = nil
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
        guard let markerInfo = marker.userData as? MapItem else {
            return false
        }
        
        if markerDidSelected {
            redrawMarker(selectedMarker)
        }
        
        switch markerInfo.category {
        case .human: marker.icon = UIImage(named: "Body_selected")
        case .ufo: marker.icon = UIImage(named: "Reproductive_selected")
        }
        marker.title = markerInfo.name
        marker.snippet = markerInfo.snippet
        
        selectedMarker = marker
        if !markerDidSelected {
            markerDidSelected = true
        }
        
        return false
    }

}

extension GoogleMapsViewController: GMUClusterManagerDelegate {
    func clusterManager(_ clusterManager: GMUClusterManager, didTap cluster: GMUCluster) -> Bool {
        let camera = GMSCameraPosition.camera(withTarget: cluster.position, zoom: mapView.camera.zoom + 1)
        mapView.animate(to: camera)
        return false
    }

}

extension GoogleMapsViewController: GMUClusterRendererDelegate {
    func renderer(_ renderer: GMUClusterRenderer, willRenderMarker marker: GMSMarker) {
        guard let markerInfo = marker.userData as? MapItem else {
            return
        }
        switch markerInfo.category {
        case .human: marker.icon = UIImage(named: "Body")
        case .ufo: marker.icon = UIImage(named: "Reproductive")
        }
    }
}
