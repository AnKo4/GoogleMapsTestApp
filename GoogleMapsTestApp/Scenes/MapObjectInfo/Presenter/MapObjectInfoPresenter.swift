//
//  MapObjectInfoPresenter.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 27.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

class MapObjectInfoPresenter: MapObjectInfoPresenterProtocol {
    var view: MapObjectInfoPresenterOutput
    var interactor: MapObjectInfoInteractorInput
    var router: MapObjectInfoRouterInput

    init(view: MapObjectInfoPresenterOutput, interactor: MapObjectInfoInteractorInput,
         router: MapObjectInfoRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension MapObjectInfoPresenter: MapObjectInfoPresenterInput {
    
}

extension MapObjectInfoPresenter: MapObjectInfoInteractorOutput {
    
}
