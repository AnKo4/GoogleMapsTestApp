//
//  DirectionsButtonView.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 06.12.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class DirectionsButtonView: UIView, DirectionsShowable {

    @IBOutlet private weak var directionsButton: UIButton?

    weak var delegate: DirectionsButtonOutput?

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromNib(nibName: "DirectionsButtonView")
        configureButton()
    }
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadFromNib(nibName: "DirectionsButtonView")
        configureButton()
    }
    
    private func configureButton() {
        directionsButton?.layer.cornerRadius = 5
        directionsButton?.titleLabel?.numberOfLines = 2
    }
    
    func setTitle(_ title: String?) {
        directionsButton?.setTitle("Directions" + "\n" + (title ?? ""), for: .normal)
    }
    
    @IBAction private func directionsButtonDidTap(_ sender: UIButton) {
        delegate?.directionsButtonDidTap()
    }
}
