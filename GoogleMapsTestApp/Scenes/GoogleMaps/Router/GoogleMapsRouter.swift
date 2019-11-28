//
//  GoogleMapsRouter.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 14.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

class GoogleMapsRouter: GoogleMapsRouterProtocol {
    
    weak var controllerPresenter: HasAbilityToPresent?
    weak var alertPresenter: AlertPresenterProtocol?
    
    init(presenter: AlertPresenterProtocol & HasAbilityToPresent) {
        self.alertPresenter = presenter
        self.controllerPresenter = presenter
    }
    
    func showObjectInfo() {
        let submodulesFactory = MapObjectInfoSubmodulesFactory()
        let module = MapObjectInfoModule(submodulesFactory: submodulesFactory)
        guard let view = module.view else { return }
        controllerPresenter?.show(viewController: view, animated: true)
    }

}
