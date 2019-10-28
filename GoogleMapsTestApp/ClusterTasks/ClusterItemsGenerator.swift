//
//  ClusterItemsGenerator.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 11.10.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation
import GoogleMaps

class ClusterItemGenerator {
    private let mapPoints = MockCoordinates().data
    private let networkManager = NetworkManager()

    
    func prepareItems(clusterManager: GMUClusterManager) {
        for item in mapPoints {
            let position = CLLocationCoordinate2DMake(item.lat, item.long)
            let mapItem = MapItem(position: position, name: item.name, snippet: item.snippet, category: item.category)
            clusterManager.add(mapItem)
        }
    }
    
    func prepareItemsFromNetwork(for clusterManager: GMUClusterManager) {
        networkManager.getPOIData() { data in
            print("got data...")
            for item in data {
                let position = CLLocationCoordinate2DMake(item.geometry.coordinates[1], item.geometry.coordinates[0])
                let category = MarkerCategory(rawValue: item.properties.category)
                let mapItem = MapItem(position: position, name: item.properties.title, snippet: item.properties.snippet, category: category ?? MarkerCategory.human)
                clusterManager.add(mapItem)
            }
        }
    }
    
}
