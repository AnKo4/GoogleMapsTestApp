//
//  UIViewExtensions.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 26.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

extension UIView {
    class var id: String {
        return String(describing: self)
    }
    
    func loadFromNib(nibName: String) {
        guard let view = UINib(nibName: nibName, bundle: Bundle(for: type(of: self))).instantiate(withOwner: self, options: nil).first as? UIView else { return }
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
}
