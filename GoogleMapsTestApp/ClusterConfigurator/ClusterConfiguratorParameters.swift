//
//  ClusterConfiguratorParameters.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 07.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol ClusterConfiguratorParameters {
    var mapPoints: [MapPointType] { get }
    var buckets: [NSNumber]? { get }
    var colors: [UIColor]? { get }
    var algorithm: ClusterAlgorithm { get }
}
