//
//  GoogleMapsModule.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 08.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

struct GoogleMapsSceneModule: BaseModuleProtocol {

    var view: (GoogleMapViewController & GoogleMapsViewModelOutput)?

    init(networkManager: GoogleMapsNetworkDataProvider, localDataSource: ClusterConfiguratorDataSourceProtocol, clusterConfigurator: ClusterConfigurator) {
        
        self.view = GoogleMapsViewController.make()

        guard self.view != nil else { return }
        let router = GoogleMapsRouter(view: self.view)
        let viewModel = GoogleMapsViewModel(networkManager: networkManager,
                                            localDataSource: localDataSource,
                                            view: self.view, router: router)
        self.view?.viewModel = viewModel
        self.view?.clusterConfigurator = clusterConfigurator
    }
}
