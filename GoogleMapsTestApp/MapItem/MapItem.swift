//
//  MapItem.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 10.10.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation
import GoogleMaps

class MapItem: NSObject, GMUClusterItem {
    var position: CLLocationCoordinate2D
    var name: String!
    var snippet: String

    init(position: CLLocationCoordinate2D, name: String, snippet: String) {
        self.position = position
        self.name = name
        self.snippet = snippet
    }
}
