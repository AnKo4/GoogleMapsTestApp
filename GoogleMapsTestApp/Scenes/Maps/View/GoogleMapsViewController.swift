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
    @IBOutlet private weak var zoomInButton: ZoomButton!
    @IBOutlet private weak var zoomOutButton: ZoomButton!
    
    private var clusterManager: GMUClusterManager!
    private var clusterManagerFromNetwork: GMUClusterManager!
    private var renderer: GMUDefaultClusterRenderer!
    private var rendererFromNetwork: GMUDefaultClusterRenderer!
    private var selectedMarker: GMSMarker!
    
    private var markerIsSelected = false
    
    var viewModel: MapViewControllerViewModelProtocol!
    var clusterConfigurator: ClusterConfiguratorProtocol!

   
    override func viewDidLoad() {
        super.viewDidLoad()

        setupMapView()
        setupButtons()
        requestForInfomation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func setupMapView() {
        let location = CLLocationCoordinate2D(latitude: StartPoint.lat, longitude: StartPoint.long)
        mapView.camera = GMSCameraPosition.camera(withTarget: location, zoom: StartPoint.zoom)
    }


    private func requestForInfomation() {
        viewModel.fetchLocalData()
        viewModel.fetchServerData()
    }
    
    private func setupButtons() {
        zoomInButton.setTitle(title: "+")
        zoomOutButton.setTitle(title: "–")
    }
    
    private func changeMapZoom(action: MapZoomAction) {
        let zoom = mapView.camera.zoom
        switch action {
        case .zoomIn: mapView.animate(toZoom: zoom + 1)
        case .zoomOut: mapView.animate(toZoom: zoom - 1)
        }
    }
    
    
    private func deselectMarker() {
        guard markerIsSelected,
            let markerInfo = selectedMarker.userData as? POIItem else {
            return
        }

        selectedMarker.icon = markerInfo.category.icon
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
        deselectMarker()
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        guard let markerInfo = marker.userData as? POIItem else {
            return false
        }
        
        deselectMarker()
        
        marker.icon = markerInfo.category.iconForSelectedState
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
        marker.icon = markerInfo.category.icon
    }
}

extension GoogleMapsViewController: GoogleMapsViewModelOutput {
    
    func showLocalData(data: ClusterConfiguratorParameters) {
        (clusterManager, renderer) =
            clusterConfigurator.configureClusterManager(for: mapView, parameters: data)
        renderer.delegate = self
        clusterManager.setDelegate(self, mapDelegate: self)

    }
    
    func showNetworkData(data: ClusterConfiguratorParameters) {
        (clusterManagerFromNetwork, rendererFromNetwork) =
            clusterConfigurator.configureClusterManager(for: mapView, parameters: data)
        rendererFromNetwork.delegate = self
        clusterManagerFromNetwork.setDelegate(self, mapDelegate: self)
    }
    
}

extension UIViewController: AlertPresenterProtocol {
    
    func present(alert viewController: UIAlertController, animated: Bool) {
        present(viewController, animated: animated)
    }
    
}

