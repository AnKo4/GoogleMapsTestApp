//
//  ObjectTitleView.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 25.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

@IBDesignable class ObjectTitleView: UIView, ObjectTitleViewProtocol {

    @IBOutlet private weak var objectTitleLabel: UILabel!
    @IBOutlet private weak var objectDescriptionLabel: UILabel!
    @IBOutlet private weak var objectRating: Rating!
    @IBOutlet private weak var distanceButton: UIButton!
    
    weak var presenter: ObjectTitlePresenterInput?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }
    
    private func loadFromNib() -> UIView {
        guard let view = UINib(nibName: "ObjectTitleView", bundle: Bundle(for: type(of: self))).instantiate(withOwner: self, options: nil).first as? UIView else { return UIView() }
        return view
    }
    
    private func configureView() {
        let view = loadFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        configureDistanceButton()

        presenter?.viewCompletedConfiguration()
    }
    
    private func configureDistanceButton() {
        distanceButton.layer.cornerRadius = 5
        distanceButton.titleLabel?.numberOfLines = 0
    }
    
}

extension ObjectTitleView: ObjectTitlePresenterOutput {
    func showObjectTitle(_ title: String) {
        objectTitleLabel.text = title
    }
    
    func showObjectDescription(_ description: String) {
        objectDescriptionLabel.text = description
    }
    
    func showObjectRarting(_ rating: RatingInfo) {
        objectRating.showRating(with: rating)
    }
    
    func showDistanceButtonTitle(_ title: String) {
        distanceButton.setTitle("Directions" + "\n" + "\(title)", for: .normal)
    }
    
}
