//
//  ClusterGenerator.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 01.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol ClusterGenerator: class {
    var dataSource: ClusterConfiguratorDataSource { get set }
    var networkManager: NetworkDataProvider { get set }
    
    func prepareItems(for clusterManager: GMUClusterManager)
    func prepareItemsFromNetwork(for clusterManager: GMUClusterManager)

}
