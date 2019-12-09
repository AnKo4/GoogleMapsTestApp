//
//  ObjectTitleModule.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 27.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

class ObjectTitleModule: BaseModuleProtocol {
    
    var view: UIView & ObjectTitleViewProtocol & ObjectTitlePresenterOutput
    
    init(with externalPresenter: ExternalPresenterInput, objectId: Int) {
        let view = ObjectTitleView()
        let service = ObjectTitleFakeService()
        let interactor = ObjectTitleInteractor(service: service, objectId: objectId)
        service.interactor = interactor
        let presenter = ObjectTitlePresenter(view: view, interactor: interactor, externalPresenter: externalPresenter)
        view.presenter = presenter
        interactor.presenter = presenter
        self.view = view
    }
}
