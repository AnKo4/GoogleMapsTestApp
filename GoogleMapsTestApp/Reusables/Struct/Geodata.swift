//
//  Geodata.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 21.10.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

struct Geodata: Codable {
    var type: String
    var features: [Feature]
}

struct Feature: Codable {
    var type: String
    var properties: Properties
    var geometry: Geometry
}

struct Properties: Codable {
    var title: String
    var snippet: String
    var category: String
}

struct Geometry: Codable {
    var coordinates: [Double]
}


extension Feature: MapPointType {
    var lat: Double {
        return self.geometry.coordinates[1]
    }
    
    var long: Double {
        return self.geometry.coordinates[0]
    }
    
    var name: String? {
        return self.properties.title
    }
    
    var snippet: String? {
        return self.properties.snippet
    }
    
    var category: MarkerCategory {
        return MarkerCategory(rawValue: self.properties.category) ?? .human
    }
    
    
}
