//
//  GoogleMapsModule.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 08.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

struct GoogleMapsSceneModule: BaseModuleProtocol {

    var view: (GoogleMapsViewControllerType & GoogleMapsViewModelOutput & AlertPresenterProtocol)?

    init() {
        
        self.view = GoogleMapsViewController.makeSelfFrom(storyboard: "Main")

        guard let presenter = view else { return }

        let networkManager = GoogleMapsNetworkManager()
        let localDataSource = MockCoordinates()
        let clusterComponentFactory = GMUComponentFactory()
        let clusterConfigurator = ClusterManagerConfigurator(factory: clusterComponentFactory)
        let router = GoogleMapsRouter(presenter: presenter)
        let viewModel = GoogleMapsSceneViewModel(networkManager: networkManager,
                                                 localDataSource: localDataSource,
                                                 view: self.view, router: router)
        self.view?.viewModel = viewModel
        self.view?.clusterConfigurator = clusterConfigurator
    }
}
