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
        
        let navController = UINavigationController()
        let module = ButtonSceneModule(buttonText: "Click me :)", navController: navController)
        navController.setViewControllers([module.view], animated: true)
        
        // MARK: - Для красоты
        navController.isNavigationBarHidden = true
        
        window?.rootViewController = navController
    }
}
