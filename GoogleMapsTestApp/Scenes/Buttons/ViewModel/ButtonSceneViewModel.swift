//
//  ButtonSceneViewModel.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 08.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol ButtonSceneViewModelProtocol: class {
    var buttonText: String { get }
    func route()
}

class ButtonSceneViewModel: ButtonSceneViewModelProtocol {

    var buttonText: String
    var router: ButtonRouterPorotocol

    init(router: ButtonRouterPorotocol, buttonText: String) {
        self.router = router
        self.buttonText = buttonText
    }

    func route() {
        router.goToMapsViewController()
    }
}
