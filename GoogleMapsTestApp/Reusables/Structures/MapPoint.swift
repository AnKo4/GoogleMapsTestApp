//
//  MapPoint.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 11.10.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

struct MapPoint: MapPointType {
    var lat: Double = 0.0
    var long: Double = 0.0
    var name: String?
    var snippet: String?
    var category: MarkerCategory
}
