//
//  MapObjectInfoRouterInput.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 28.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol MapObjectInfoRouterInput: class {
    func popMapsObjectInfo()
}

extension MapObjectInfoRouterInput where Self: MapObjectInfoRouterProtocol {
    func popMapsObjectInfo() {
        view?.close()
    }
}
