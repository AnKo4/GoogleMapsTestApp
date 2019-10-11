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
    let mapPoints = MockCoordinates().data
    
    func prepareItems(clusterManager: GMUClusterManager) {
        for item in mapPoints {
            let position = CLLocationCoordinate2DMake(item.lat, item.long)
            let mapItem = MapItem(position: position, name: item.name, snippet: item.snippet)
            clusterManager.add(mapItem)
        }
    }
}
