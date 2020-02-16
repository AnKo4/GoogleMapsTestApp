//
//  RatingProtocol.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 09.12.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol RatingProtocol: class {
    func showRatingStars(_ count: Int)
    func showRatingText(voices: Int, on agency: String)
    func makeStar(for condition: Bool) -> UIImage?
}

extension RatingProtocol {
    func makeStar(for condition: Bool) -> UIImage? {
        switch condition {
        case true: return UIImage(named: "ic_star_orange")
        case false: return UIImage(named: "ic_star_gray")
        }
    }
}
