//
//  RatingShowable.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 26.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol RatingShowable {
    func showRating(with data: RatingInfo)
    func showRatingStars(_ count: Int)
    func showRatingText(voices: Int, on agency: String)
}

extension RatingShowable {
    func makeStar(for condition: Bool) -> UIImage? {
        switch condition {
        case true: return UIImage(named: "ic_star_orange")
        case false: return UIImage(named: "ic_star_gray")
        }
    }
    
    func showRating(with data: RatingInfo) {
        showRatingStars(data.value)
        showRatingText(voices: data.voicesCount, on: data.agency)
    }
}
