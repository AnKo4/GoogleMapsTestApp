//
//  RatingShowable.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 26.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol RatingShowable {
    func showRating(stars: Int, voices: Int, agency: String)
}

extension RatingShowable where Self: RatingProtocol {
    func showRating(stars: Int, voices: Int, agency: String) {
        showRatingStars(stars)
        showRatingText(voices: voices, on: agency)
    }
}
