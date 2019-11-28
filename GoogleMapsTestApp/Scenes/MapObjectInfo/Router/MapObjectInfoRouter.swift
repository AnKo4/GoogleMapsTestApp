//
//  MapObjectInfoRouter.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 27.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

class MapObjectInfoRouter: MapObjectInfoRouterProtocol {
    weak var view: MapObjectInfoRouterOutput?
    
    init(view: MapObjectInfoRouterOutput) {
        self.view = view
    }
}

extension MapObjectInfoRouter: MapObjectInfoRouterInput {
    
}
