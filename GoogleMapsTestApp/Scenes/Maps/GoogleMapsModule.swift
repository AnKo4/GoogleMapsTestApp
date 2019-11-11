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
    
    init() {
        let networkManager = NetworkManager()
        let localDataSource = MockCoordinates()
        let viewModel = GoogleMapsViewModel(networkManager: networkManager, localDataSource: localDataSource)
        self.view = GoogleMapsViewController()
        self.view.viewModel = viewModel
//        self.view.launch()
    }
}

