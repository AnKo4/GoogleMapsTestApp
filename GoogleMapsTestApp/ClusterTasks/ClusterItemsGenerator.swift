//
//  ClusterItemsGenerator.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 11.10.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

///  datasource (хранилище)
///  configurator (не создает ничего только конфигурирует)
///


class ClusterItemsGenerator: ClusterGenerator {
    
    var dataSource: ClusterConfiguratorDataSource
    
    var networkManager: NetworkDataProvider

    
    init(networkManager: NetworkDataProvider, dataSource: ClusterConfiguratorDataSource) {
        self.networkManager = networkManager
        self.dataSource = dataSource
    }
    
    func prepareItems(for clusterManager: GMUClusterManager) {
        for item in dataSource.mapPoints {
            let position = CLLocationCoordinate2DMake(item.lat, item.long)
            let mapItem = MapItem(position: position, name: item.name, snippet: item.snippet, category: item.category)
            clusterManager.add(mapItem)
        }
        clusterManager.cluster()
    }
    
    func prepareItemsFromNetwork(for clusterManager: GMUClusterManager) {
        networkManager.getPOIData() { data in
            for item in data {
                let position = CLLocationCoordinate2DMake(item.geometry.coordinates[1], item.geometry.coordinates[0])
                let category = MarkerCategory(rawValue: item.properties.category)
                let mapItem = MapItem(position: position, name: item.properties.title, snippet: item.properties.snippet, category: category ?? MarkerCategory.human)
                clusterManager.add(mapItem)
            }
            clusterManager.cluster()
        }
    }
    
}
