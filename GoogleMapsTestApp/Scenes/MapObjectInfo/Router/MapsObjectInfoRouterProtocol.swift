//
//  MapsObjectInfoRouterProtocol.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 27.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol MapsObjectInfoRouterProtocol: class {
    var view: MapObjectInfoRouterOutput? { get }
    
    func popMapsObjectInfo()
}

extension MapsObjectInfoRouterProtocol {
    func popMapsObjectInfo() {
        view?.close()
    }
}
