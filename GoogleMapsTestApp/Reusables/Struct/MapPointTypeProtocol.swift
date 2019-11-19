//
//  MapPointType.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 01.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol MapPointPositionable {
    var lat: Double { get }
    var long: Double { get }
    
    var name: String? { get }
    var snippet: String? { get }
}
