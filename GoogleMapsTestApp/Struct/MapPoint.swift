//
//  MapPoint.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 11.10.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

struct MapPoint: MapPointType {
    var lat = 0.0
    var long = 0.0
    var name = ""
    var snippet = ""
    var category: MarkerCategory
}

struct YandexMapMarker {
    var pos: Position
    fileprivate var title: String
    var snippet: String
}

extension YandexMapMarker: MapPointPositionable {
    var lat: Double {
        return pos.lat
    }
    
    var long: Double {
        return pos.long
    }
    
    var name: String {
        return title
    }
}

struct Position {
    var lat = 0.0
    var long = 0.0
}

