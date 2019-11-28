//
//  MapObjectInfoModule.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 27.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

class MapObjectInfoModule: BaseModuleProtocol {
    
    var view: UIViewController? // & ModulesHolderProtocol & MapObjectInfoProtocol & MapObjectInfoPresenterOutput)?
    var submodulesFactory: MapObjectInfoSubmodulesFactoryProtocol
    
    init(submodulesFactory: MapObjectInfoSubmodulesFactoryProtocol) {
        self.submodulesFactory = submodulesFactory
        let view = MapObjectInfoViewController(nibName: MapObjectInfoViewController.id, bundle: nil)

        let interactor = MapObjectInfoInteractor()
        let router = MapObjectInfoRouter(view: view)
        let presenter = MapObjectInfoPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        
        view.modules = submodulesFactory.makeModules()
        self.view = view
    }
}
