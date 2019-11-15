//
//  GoogleMapsViewModel.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 28.10.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

class GoogleMapsViewModel: MapViewControllerViewModel {

    var view: GoogleMapsViewModelOutput?
    var router: GoogleMapsRouterProtocol

    
    private var networkManager: GoogleMapsNetworkDataProvider!
    private var localDataSource: ClusterConfiguratorDataSourceProtocol!

    init(networkManager: GoogleMapsNetworkDataProvider,
         localDataSource: ClusterConfiguratorDataSourceProtocol,
         view: GoogleMapsViewModelOutput?,
         router: GoogleMapsRouterProtocol) {
        self.networkManager = networkManager
        self.localDataSource = localDataSource
        self.view = view
        self.router = router
    }

    func fetchLocalData() {
        let outputData = DataForClusterConfigurator(mapPoints: localDataSource.mapPoints,
                                                    buckets: nil,
                                                    colors: nil,
                                                    algorithm: .distanceBased)
        view?.showLocalData(data: outputData)
    }

    func fetchServerData() {
        networkManager.fetchGooglePOIData { [weak self] (data, error) in
            guard let self = self else { return }
            switch error {
            case nil:
                guard let data = data else { return }
                let outputData = DataForClusterConfigurator(mapPoints: data.features,
                                                            buckets: Constants.buckets,
                                                            colors: Constants.colors,
                                                            algorithm: .gridBased)
                self.view?.showNetworkData(data: outputData)
            default:
                guard let error = error else { return }
                self.router.showAlert(with: error.localizedDescription)
            }
        }
    }
}
