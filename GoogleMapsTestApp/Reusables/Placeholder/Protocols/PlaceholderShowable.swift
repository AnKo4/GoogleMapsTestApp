//
//  PlaceholderShowable.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 04.12.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol PlaceholderShowable {
    func showPlaceholder(message: String, backgroundColor: UIColor?, textColor: UIColor?)
    func hidePlaceholder()
}

extension PlaceholderShowable where Self: UIView {
    
    func showPlaceholder(message: String, backgroundColor: UIColor? = .white, textColor: UIColor? = .black) {
        let placeholder = PlaceholderView()
        placeholder.setBackground(backgroundColor)
        placeholder.setTextColor(textColor)
        placeholder.showMessage(message)
        addSubview(placeholder)
    }
    
    func hidePlaceholder() {
        guard let subview = subviews.last as? (UIView & PlaceholderType) else { return }
        subview.removeFromSuperview()
    }
}

extension PlaceholderShowable where Self: UIViewController {
    
    func showPlaceholder(message: String, backgroundColor: UIColor = .white, textColor: UIColor = .black) {
        let placeholder = PlaceholderView()
        placeholder.setBackground(backgroundColor)
        placeholder.setTextColor(textColor)
        placeholder.showMessage(message)
        view.addSubview(placeholder)
    }
    
    func hidePlaceholder() {
        guard let subview = view.subviews.last as? (UIView & PlaceholderType) else { return }
        subview.removeFromSuperview()
    }
}
