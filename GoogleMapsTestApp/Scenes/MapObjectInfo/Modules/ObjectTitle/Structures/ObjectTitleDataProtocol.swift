//
//  ObjectTitleDataProtocol.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 26.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol ObjectTitleDataProtocol {
    var objectTitle: String { get }
    var objectDescription: String { get }
    var objectRating: RatingInfo { get }
    var distanceButtonTitle: String { get }
}
