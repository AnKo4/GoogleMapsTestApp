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
    
    init() {
        let view = ObjectTitleView()
        let service = ObjectTitleFakeService()
        let interactor = ObjectTitleInteractor(service: service)
        service.interactor = interactor
        let router = ObjectTitleRouter()
        let presenter = ObjectTitlePresenter(interactor: interactor, router: router)
        view.presenter = presenter
        self.view = view
    }
}
