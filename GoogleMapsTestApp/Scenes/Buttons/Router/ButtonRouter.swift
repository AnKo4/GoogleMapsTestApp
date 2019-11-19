//
//  MapsRouter.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 08.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//


import UIKit

class ButtonRouter: ButtonRouterPorotocol {
     
    weak var navController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navController = navigationController
    }
    
    func showGoogleMapsViewController() {
        let module = GoogleMapsSceneModule()
        guard let view = module.view else { return }
        navController?.pushViewController(view, animated: true)
        navController?.isNavigationBarHidden = false
    }
    
}
