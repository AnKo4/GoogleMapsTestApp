//
//  SectionViewWithButtonOutputable.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 09.12.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

@objc protocol SectionViewWithButtonOutputable: class {
    var delegate: SectionViewWithButtonOutput? { get set }
}
