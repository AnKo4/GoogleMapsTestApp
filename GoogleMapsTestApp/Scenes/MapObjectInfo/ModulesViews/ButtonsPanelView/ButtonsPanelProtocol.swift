//
//  ButtonsPanelProtocol.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 06.12.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

@objc protocol ButtonsPanelProtocol: class {
    var delegate: ButtonsPanelOutput? { get set }
}
