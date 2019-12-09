//
//  SectionViewProtocol.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 09.12.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

@objc protocol SectionViewProtocol: class {
    func show(title: String?, content: String?)
}
