//
//  GoogleMapsModule.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 08.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

struct GoogleMapsSceneModule: BaseModuleProtocol {
    
    var view: GoogleMapsViewController
    
    init(networkManager: NetworkDataProvider, localDataSource: ClusterConfiguratorDataSourceProtocol, clusterConfigurator: ClusterConfigurator) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.view = storyboard.instantiateViewController(withIdentifier: "GoogleMapsViewController") as! GoogleMapsViewController
//        let networkManager = NetworkManager()
//        let localDataSource = MockCoordinates()
        let viewModel = GoogleMapsViewModel(networkManager: networkManager, localDataSource: localDataSource)
        self.view.viewModel = viewModel
//        self.view.clusterConfigurator = ClusterManagerConfigurator()
        self.view.clusterConfigurator = clusterConfigurator
    }
}


//class Instantiator {
//    static func instantiate<T: UIViewController>(storyboard storyboardName: String, viewController: T) -> T {
//        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
//        let controller = storyboard.instantiateViewController(withIdentifier: viewController.id) as! T
//        return controller
//
//    }
//}
