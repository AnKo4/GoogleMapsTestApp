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
    var iconGeneratorParameters: IconGeneratorParametersType { get }
    var algorithm: ClusterAlgorithmType { get }
}
