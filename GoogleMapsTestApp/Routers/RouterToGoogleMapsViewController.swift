//
//  ViewContollerRouter.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 06.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation


class RouterToGoogleMapsViewController: Router {
    
    func route(from controller: UIViewController) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let destinationController = storyboard.instantiateViewController(withIdentifier: "MapVC") as? GoogleMapViewController else {
            return
        }
        
//        injectDependencies(to: destinationController)
        
        controller.navigationController?.pushViewController(destinationController, animated: true)
    }
/// move to di
//    private func injectDependencies(to controller: GoogleMapViewController) {
//        let networkManager = NetworkManager()
//        let dataSource = MockCoordinates()
//        let viewModel = GoogleMapsViewModel(localDataSource: dataSource, networkManager: networkManager)
//        controller.viewModel = viewModel
//        let clusterConfigurator = ClusterManagerConfigurator()
//        controller.clusterConfigurator = clusterConfigurator
//    }
}

typealias ViewControllerType = UIViewController & ViewModelHolder

/// конкртеная реализация
//struct GoogleMapsModule: BaseModuleProtocol {
//    
//    var view: ViewControllerType
//    
//    init() {
//        self.view = GoogleMapsViewController()
//        let router = MapsRouter(navController: self.view.navigationController)
//        let viewModel = GoogleMapsViewModel(router: router)
//        self.view.viewModel = viewModel
//    }
//}







