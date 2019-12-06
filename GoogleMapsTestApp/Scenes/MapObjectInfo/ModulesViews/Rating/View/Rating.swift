//
//  Rating.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 25.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

@IBDesignable class Rating: UIView {
    
    @IBOutlet private weak var ratingStarsStack: UIStackView!
    @IBOutlet private weak var ratingTextLabel: UILabel!
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromNib(nibName: "Rating")
//        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadFromNib(nibName: "Rating")
//        configureView()
    }
    
//    private func loadFromNib() -> UIView {
//        guard let view = UINib(nibName: "Rating", bundle: Bundle(for: type(of: self))).instantiate(withOwner: self, options: nil).first as? UIView else { return UIView() }
//        return view
//    }
//
//    private func configureView() {
//        let view = loadFromNib()
//        view.frame = bounds
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        addSubview(view)
//    }
}
 
extension Rating: RatingShowable {
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
