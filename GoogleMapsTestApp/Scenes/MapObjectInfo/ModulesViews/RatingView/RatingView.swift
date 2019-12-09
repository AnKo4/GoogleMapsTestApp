//
//  RatingView.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 07.12.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class RatingView: UIView {

    @IBOutlet weak private var rating: Rating?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromNib(nibName: "RatingView")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadFromNib(nibName: "RatingView")
    }

}

extension RatingView: RatingOutletProtocol {
    func showRating(stars: Int, voices: Int, agency: String) {
        rating?.showRating(stars: stars, voices: voices, agency: agency)
    }
}
