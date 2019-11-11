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
    
    func route() {
        let module = GoogleMapsSceneModule()
        navController?.pushViewController(module.view, animated: true)
//        module.view.launch()
    }
    
}


class GoogleMapsFactory {
    
}
