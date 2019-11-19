//
//  ClusterConfigurator.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 05.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation


class ClusterManagerConfigurator: ClusterConfiguratorProtocol {
    
    var componentsFactory: GMUComponentFactoryProtocol!
    
    init(factory: GMUComponentFactoryProtocol) {
        self.componentsFactory = factory
    }

    func configureClusterManager(for mapView: GMSMapView,
                                 parameters: ClusterConfiguratorParameters ) -> (GMUClusterManager, GMUDefaultClusterRenderer) {
        let iconGenerator = componentsFactory.makeIconGenerator(buckets: parameters.buckets, colors: parameters.colors)
        let clusterAlgorithm = parameters.algorithm.value
        let renderer = GMUDefaultClusterRenderer(mapView: mapView, clusterIconGenerator: iconGenerator)
        let clusterManager = GMUClusterManager(map: mapView, algorithm: clusterAlgorithm, renderer: renderer)
        configure(clusterManager: clusterManager, from: parameters.mapPoints)
        return (clusterManager, renderer)
    }
    
    private func configure(clusterManager: GMUClusterManager, from mapPoints: [MapPointType]) {
        for item in mapPoints {
            let position = CLLocationCoordinate2DMake(item.lat, item.long)
            let mapItem = POIItem(position: position, name: item.name ?? "", snippet: item.snippet ?? "", category: item.category)
            clusterManager.add(mapItem)
        }
        clusterManager.cluster()
    }
}
