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
        let module = ButtonSceneModule(buttonTitle: "Click" + "\n" + "me :)", navController: navController)
        guard let view = module.view else { return }
        navController.setViewControllers([view], animated: true)
        
        navController.isNavigationBarHidden = true
        
        window?.rootViewController = navController
    }
}
