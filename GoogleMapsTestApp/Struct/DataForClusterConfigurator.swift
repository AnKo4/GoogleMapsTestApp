//
//  DataForClusterConfigurator.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 07.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

struct DataForClusterConfigurator: ClusterConfiguratorParameters {
    var mapPoints: [MapPointType]
    var buckets: [NSNumber]?
    var colors: [UIColor]?
    var algorithm: ClusterAlgorithm
}
