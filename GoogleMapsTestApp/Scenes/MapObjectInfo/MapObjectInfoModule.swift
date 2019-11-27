//
//  MapObjectInfoModule.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 27.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

class MapObjectInfoModule: BaseModuleProtocol {
    
    var view: (UIViewController & ModulesHolderProtocol & MapObjectInfoProtocol)?
    
    init() {
        var modules: [UIView] = []
        
        let view = MapObjectInfoViewController(nibName: MapObjectInfoViewController.id, bundle: nil)

        let router = MapsObjectInfoRouter(view: view)
        let presenter = MapObjectInfoPresenter(router: router)
        view.presenter = presenter
        
        let objectTitleModule = ObjectTitleModule()
        modules.append(objectTitleModule.view)

        view.modules = modules
        self.view = view
    }
    
}
