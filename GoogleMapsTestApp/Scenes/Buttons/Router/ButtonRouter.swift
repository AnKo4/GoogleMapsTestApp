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
    
    func goToMapsViewController() {
        let networkManager = NetworkManager()
        let localDataSource = MockCoordinates()
        let clusterConfigurator = ClusterManagerConfigurator()
        let module = GoogleMapsSceneModule(networkManager: networkManager, localDataSource: localDataSource, clusterConfigurator: clusterConfigurator)
        navController?.pushViewController(module.view, animated: true)
        navController?.isNavigationBarHidden = false
    }
    
}
