//
//  ButtonSceneModule.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 08.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

struct ButtonSceneModule: BaseModuleProtocol {

    var view: (UIViewController & ButtonViewControllerProtocol)?

    init(buttonText: String, navController: UINavigationController) {

        self.view = ButtonViewController.make()

        guard self.view != nil else { return }
        let router = ButtonRouter(navigationController: navController)
        let viewModel = ButtonSceneViewModel(router: router, buttonText: buttonText)
        self.view?.viewModel = viewModel
    }
}
