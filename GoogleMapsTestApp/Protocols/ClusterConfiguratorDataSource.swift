//
//  ClusterConfiguratorDataSource.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 01.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol ClusterConfiguratorDataSource: class {
    var mapPoints: [MapPointType] { get set }
}
