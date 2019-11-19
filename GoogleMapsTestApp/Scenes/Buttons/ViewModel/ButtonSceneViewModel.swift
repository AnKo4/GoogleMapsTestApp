//
//  ButtonSceneViewModel.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 08.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

class ButtonSceneViewModel: ButtonSceneViewModelProtocol {

    var buttonTitle: String
    var router: ButtonRouterPorotocol

    init(router: ButtonRouterPorotocol, buttonTitle: String) {
        self.router = router
        self.buttonTitle = buttonTitle
    }

    func route() {
        router.showGoogleMapsViewController()
    }
}
