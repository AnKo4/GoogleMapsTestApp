//
//  DirectionsButtonView.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 06.12.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class DirectionsButtonView: UIView, NibLoadable, NibConfigurable, DirectionsShowable {

    @IBOutlet private weak var directionsButton: UIButton?

    weak var delegate: DirectionsButtonOutput?

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()

    }
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }

    private func configureButton() {
        directionsButton?.layer.cornerRadius = 5
        directionsButton?.titleLabel?.font = UIFont(name: "Roboto", size: 15)
    }
    
    func setTitle(_ title: String?) {
        directionsButton?.setTitle(title, for: .normal)
    }
    
    @IBAction private func directionsButtonDidTap(_ sender: UIButton) {
        delegate?.directionsButtonDidTap()
    }
}
