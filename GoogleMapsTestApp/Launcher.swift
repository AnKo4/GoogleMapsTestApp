//
//  Launcher.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 11.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

class Launcher {
    static func launch(with window: UIWindow?) {
        if let navController = window?.rootViewController as? UINavigationController,
            let controller = navController.viewControllers.first as? ButtonViewController {
            let router = ButtonRouter(navigationController: controller.navigationController)
            let viewModel = ButtonSceneViewModel(router: router, buttonText: "Click me :)")
            controller.viewModel = viewModel
        }
    }
}
