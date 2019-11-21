//
//  GoogleMapsViewModel.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 28.10.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

class GoogleMapsSceneViewModel: GoogleMapsSceneViewModelProtocol {

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
        let iconGeneratorParameters = IconGeneratorParameters(buckets: nil, colors: nil)
        let outputData = DataForClusterConfigurator(mapPoints: localDataSource.mapPoints,
                                                    iconGeneratorParameters: iconGeneratorParameters,
                                                    algorithm: .distanceBased)
        view?.showLocalData(outputData)
    }

    func fetchServerData() {
        networkManager.fetchGooglePOIData { [weak self] (data, error) in
            guard let self = self else { return }
            switch error {
            case nil:
                guard let data = data else { return }
                let iconGeneratorParameters = self.makeIconGeneratorParameters(buckets: ClusterConfiguratorParametersConstants.buckets,
                    colors: ClusterConfiguratorParametersConstants.colors)
                let outputData = DataForClusterConfigurator(mapPoints: data.features,
                                                            iconGeneratorParameters: iconGeneratorParameters,
                                                            algorithm: .gridBased)
                self.view?.showNetworkData(outputData)
            default:
                guard let error = error else { return }
                self.router.showAlert(with: error.localizedDescription)
            }
        }
    }
    
    func markerDidSelected() {
        router.showViewController()
    }
    
    private func makeIconGeneratorParameters(buckets: [NSNumber]?, colors: [UIColor]?) -> IconGeneratorParametersType {
        guard
            let buckets = buckets, let colors = colors,
            !buckets.isEmpty,
            buckets.count == colors.count,
            buckets.sorted(by: {$0.intValue < $1.intValue}) == buckets
            else {
                return IconGeneratorParameters(buckets: nil, colors: nil)
        }
        return IconGeneratorParameters(buckets: buckets, colors: colors)
    }
}
