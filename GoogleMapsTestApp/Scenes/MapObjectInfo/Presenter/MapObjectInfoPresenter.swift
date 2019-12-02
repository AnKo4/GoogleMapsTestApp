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
    var router: MapObjectInfoRouterInput & AlertShowable

    init(view: MapObjectInfoPresenterOutput, interactor: MapObjectInfoInteractorInput,
         router: MapObjectInfoRouterInput & AlertShowable) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension MapObjectInfoPresenter: MapObjectInfoPresenterInput {
    
}

extension MapObjectInfoPresenter: MapObjectInfoInteractorOutput {
    
}

extension MapObjectInfoPresenter: ExternalPresenterInput {
    func submoduleDidReceiveError(_ error: Error) {
        router.showAlert(with: error.localizedDescription)
    }
}
