//
//  ObjectTitleData.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 26.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

// MARK: - Struct for presenter
struct ObjectTitleData: ObjectTitleDataProtocol {
    var objectTitle: String
    var objectDescription: String
    var objectRating: RatingInfo
    var distanceButtonTitle: String
}
