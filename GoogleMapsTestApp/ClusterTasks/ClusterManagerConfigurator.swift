//
//  ClusterConfigurator.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 05.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

class ClusterManagerConfigurator: ClusterConfigurator {
    
    func configureClusterManager(for mapView: GMSMapView, buckets: [NSNumber], colors: [UIColor], algorithm: ClusterAlgorithm, mapPoints: [MapPointType]) -> (GMUClusterManager, GMUDefaultClusterRenderer) {
        let iconGenerator = makeIconGenerator(buckets: buckets, colors: colors)
        let clusterAlgorithm = makeAlgorithm(algorithm: algorithm)
        let renderer = GMUDefaultClusterRenderer(mapView: mapView, clusterIconGenerator: iconGenerator)
        let clusterManager = GMUClusterManager(map: mapView, algorithm: clusterAlgorithm, renderer: renderer)
        makeCluster(for: clusterManager, from: mapPoints)
        return (clusterManager, renderer)
    }
    
    private func makeIconGenerator(buckets: [NSNumber], colors: [UIColor]) -> GMUClusterIconGenerator {
        guard
            buckets.count != 0,
            buckets.count == colors.count
            else {
                return GMUDefaultClusterIconGenerator()
        }
        let iconGenerator = GMUDefaultClusterIconGenerator(buckets: buckets, backgroundColors: colors)
        return iconGenerator
    }
    
    private func makeAlgorithm(algorithm: ClusterAlgorithm) -> GMUClusterAlgorithm {
        switch algorithm {
        case .distanceBased:
            return GMUNonHierarchicalDistanceBasedAlgorithm()
        case .gridBased:
            return GMUGridBasedClusterAlgorithm()
        }
    }
    
    private func makeCluster(for clusterManager: GMUClusterManager, from mapPoints: [MapPointType]) {
        for item in mapPoints {
            let position = CLLocationCoordinate2DMake(item.lat, item.long)
            let mapItem = MapItem(position: position, name: item.name, snippet: item.snippet, category: item.category)
            clusterManager.add(mapItem)
        }
        clusterManager.cluster()
    }
}
