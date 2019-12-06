//
//  NibConfigurable.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 06.12.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol NibConfigurable {
    func configureView()
}

extension NibConfigurable where Self: (UIView & NibLoadable) {
    func configureView() {
        let view = Self.loadFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
}
