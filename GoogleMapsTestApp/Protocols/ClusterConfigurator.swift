//
//  ClusterConfigurator.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 05.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol ClusterConfigurator: class {
    func configureClusterManager(for mapView: GMSMapView, buckets: [NSNumber], colors: [UIColor], algorithm: ClusterAlgorithm, mapPoints: [MapPointType]) -> (GMUClusterManager, GMUDefaultClusterRenderer)
}
