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
        self.view = GoogleMapsViewController.make()
        let viewModel = GoogleMapsViewModel(networkManager: networkManager, localDataSource: localDataSource)
        self.view.viewModel = viewModel
        self.view.clusterConfigurator = clusterConfigurator
    }
}
