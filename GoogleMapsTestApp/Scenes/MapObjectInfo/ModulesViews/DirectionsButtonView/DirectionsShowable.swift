//
//  DirectionsShowable.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 06.12.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

@objc protocol DirectionsShowable {
    var delegate: DirectionsButtonOutput? { get set }
    
    func setTitle(_ title: String?)
}
