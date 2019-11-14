//
//  ViewController.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 10.10.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class GoogleMapsViewController: GoogleMapViewController {
    
    @IBOutlet private weak var mapView: GMSMapView!
    @IBOutlet private weak var zoomInButton: UIButton!
    @IBOutlet private weak var zoomOutButton: UIButton!
    
    private var clusterManager: GMUClusterManager!
    private var clusterManagerFromNetwork: GMUClusterManager!
    private var renderer: GMUDefaultClusterRenderer!
    private var rendererFromNetwork: GMUDefaultClusterRenderer!
    private var selectedMarker: GMSMarker!
    
    private var markerIsSelected = false
    
    var viewModel: MapViewControllerViewModel!
    var clusterConfigurator: ClusterConfigurator!

   
    override func viewDidLoad() {
        super.viewDidLoad()

        setupMapView()
        setupView()
        setupButtons()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func setupMapView() {
        let location = CLLocationCoordinate2D(latitude: StartPoint.lat, longitude: StartPoint.long)
        mapView.camera = GMSCameraPosition.camera(withTarget: location, zoom: StartPoint.zoom)
    }


    private func setupView() {
        viewModel.fetchLocalData()
        viewModel.fetchServerData()
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
    
    private func markerIcon(category: MarkerCategory) -> UIImage? {
        switch category {
        case .human: return UIImage(named: "Body")
        case .ufo: return UIImage(named: "Reproductive")
        }
    }
    
    private func redrawDeselectedMarker() {
        guard markerIsSelected,
            let markerInfo = selectedMarker.userData as? POIItem else {
            return
        }

        selectedMarker.icon = markerIcon(category: markerInfo.category)
        selectedMarker.title = nil
        selectedMarker.snippet = nil
        
        markerIsSelected = false
    }
    
    @IBAction private func zoomInButtonTapped(_ sender: UIButton) {
        changeMapZoom(action: .zoomIn)
    }
    
    @IBAction private func zoomOutButtonTapped(_ sender: UIButton) {
        changeMapZoom(action: .zoomOut)
    }
    
}

extension GoogleMapsViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        redrawDeselectedMarker()
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        guard let markerInfo = marker.userData as? POIItem else {
            return false
        }
        
        redrawDeselectedMarker()
        
        switch markerInfo.category {
        case .human: marker.icon = UIImage(named: "Body_selected")
        case .ufo: marker.icon = UIImage(named: "Reproductive_selected")
        }
        marker.title = markerInfo.name
        marker.snippet = markerInfo.snippet
        
        selectedMarker = marker
        markerIsSelected = true
        
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
        guard let markerInfo = marker.userData as? POIItem else {
            return
        }
        marker.icon = markerIcon(category: markerInfo.category)
    }
}

extension GoogleMapsViewController: GoogleMapsViewModelOutput {
    
    func showLocalData(data: ClusterConfiguratorParameters) {
        (clusterManager, renderer) =
            clusterConfigurator.configureClusterManager(for: mapView,
                                                        buckets: data.buckets,
                                                        colors: data.colors,
                                                        algorithm: data.algorithm,
                                                        mapPoints: data.mapPoints)
        renderer.delegate = self
        clusterManager.setDelegate(self, mapDelegate: self)

    }
    
    func showNetworkData(data: ClusterConfiguratorParameters) {
        (clusterManagerFromNetwork, rendererFromNetwork) =
            clusterConfigurator.configureClusterManager(for: mapView,
                                                        buckets: data.buckets,
                                                        colors: data.colors,
                                                        algorithm: data.algorithm,
                                                        mapPoints: data.mapPoints)
        rendererFromNetwork.delegate = self
        clusterManagerFromNetwork.setDelegate(self, mapDelegate: self)

    }
    
}
