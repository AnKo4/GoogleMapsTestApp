//
//  ObjectTitleData.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 26.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

// MARK: - Struct for presenter
struct ObjectTitleData: ObjectTitleDataProtocol, Codable {
    var objectTitle: String
    var objectDescription: String
    var objectRating: RatingInfoData
    var distanceButtonTitle: String
}

struct RatingInfoData: RatingInfo, Codable {
    var stars: Int
    var voicesCount: Int
    var agency: String
}

struct ObjectTitleCorruptedData: Codable {
    var objectTitled: String
    var objectDescription: String
    var objectRating: RatingInfoData
    var distanceButtonTitle: String
}

extension ObjectTitleCorruptedData: ObjectTitleDataProtocol {
    var objectTitle: String {
        return self.objectTitled
    }
}
