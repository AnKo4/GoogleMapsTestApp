//
//  UIViewControllerExtensions.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 11.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

extension UIViewController {
    class var id: String {
        return String(describing: self)
    }
    
    class func make<T>() -> T? {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: self.id) as? T
    }
}
