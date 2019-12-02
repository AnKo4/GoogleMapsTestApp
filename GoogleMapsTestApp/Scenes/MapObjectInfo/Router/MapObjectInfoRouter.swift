//
//  MapObjectInfoRouter.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 27.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

class MapObjectInfoRouter: MapObjectInfoRouterProtocol, AlertPresenterHolder, AlertShowable {
    weak var view: MapObjectInfoRouterOutput?
    weak var alertPresenter: AlertPresenterProtocol?

    init(view: MapObjectInfoRouterOutput & AlertPresenterProtocol) {
        self.view = view
        self.alertPresenter = view
    }
}

extension MapObjectInfoRouter: MapObjectInfoRouterInput {
    
}
