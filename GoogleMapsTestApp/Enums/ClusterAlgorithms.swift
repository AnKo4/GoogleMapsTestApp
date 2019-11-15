//
//  ClusterAlgorithms.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 05.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

enum ClusterAlgorithm: String, Codable {
    case distanceBased
    case gridBased
}

extension ClusterAlgorithm {
    var value: GMUClusterAlgorithm {
        switch self {
        case .distanceBased:
            return GMUNonHierarchicalDistanceBasedAlgorithm()
        case .gridBased:
            return GMUGridBasedClusterAlgorithm()
        }
    }
}
