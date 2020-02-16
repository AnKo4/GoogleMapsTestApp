//
//  Rating.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 25.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

@IBDesignable class Rating: UIView, RatingShowable {
    
    @IBOutlet private weak var ratingStarsStack: UIStackView!
    @IBOutlet private weak var ratingTextLabel: UILabel!
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromNib(nibName: "Rating")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadFromNib(nibName: "Rating")
    }
}
 
extension Rating: RatingProtocol {
    internal func showRatingStars(_ count: Int) {
        guard let stars = ratingStarsStack.subviews as? [UIImageView] else { return }
        for i in 1...5 {
            let star = makeStar(for: i <= count)
            stars[i - 1].image = star
        }
    }
    
    internal func showRatingText(voices: Int, on agency: String) {
        ratingTextLabel.text = "(\(voices)) on \(agency)"
    }
}
