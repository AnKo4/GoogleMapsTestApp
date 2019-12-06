//
//  ModulesHolderProtocol.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 27.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol ModulesHolderProtocol: class {
    var modules: [UIView] { get set }
    func addModules()
}