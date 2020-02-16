//
//  RatingInfo.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 26.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol RatingInfo {
    var stars: Int { get }
    var voicesCount: Int { get }
    var agency: String { get }
}
