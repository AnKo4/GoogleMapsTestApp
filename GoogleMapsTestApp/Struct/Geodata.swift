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
}

struct Geometry: Codable {
    var coordinates: [Double]
}
