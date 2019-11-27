//
//  MapObjectInfoPresenter.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 27.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

class MapObjectInfoPresenter: MapObjectInfoPresenterProtocol {
    var router: MapsObjectInfoRouter?
    
    init(router: MapsObjectInfoRouter) {
        self.router = router
    }
}
