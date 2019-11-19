//
//  ButtonSceneViewModelProtocol.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 19.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol ButtonSceneViewModelProtocol: class {
    var buttonTitle: String { get }
    func route()
}
