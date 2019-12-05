//
//  PlaceholderContainerType.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 05.12.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol PlaceholderContainerType: class {
    var container: UIView? { get }
    var placeholder: UIView? { get set }
    
    func showPlaceholder(_ placeholder: UIView)
    func hidePlaceholder()
    
}

extension PlaceholderContainerType where Self: UIView {
    var container: UIView? {
        return self
    }
}

extension PlaceholderContainerType where Self: UIViewController {
    var container: UIView? {
        return self.view
    }
}

extension PlaceholderContainerType {
    func showPlaceholder(_ placeholder: UIView) {
        self.placeholder = placeholder
        self.container?.addSubview(placeholder)
        self.container?.bringSubviewToFront(placeholder)
    }
    
    func hidePlaceholder() {
        guard let placeholder = placeholder else { return }
        
        self.container?.sendSubviewToBack(placeholder)
        placeholder.removeFromSuperview()
    }
}
