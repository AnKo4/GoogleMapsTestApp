//
//  GoogleMapsViewModel.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 28.10.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

struct GoogleMapsViewModel: MapViewControllerViewModel{
            
    private var networkManager: NetworkDataProvider!
    private var localDataSource: ClusterConfiguratorDataSourceProtocol!
    
    init(networkManager: NetworkDataProvider, localDataSource: ClusterConfiguratorDataSourceProtocol) {
        self.networkManager = networkManager
        self.localDataSource = localDataSource
    }
    
    func fetchLocalData() -> ClusterConfiguratorParameters {
        let outputData = DataForClusterConfigurator(mapPoints: localDataSource.mapPoints, buckets: nil, colors: nil, algorithm: ClusterAlgorithm(rawValue: "distanceBased") ?? .distanceBased)
        return outputData
    }
    
    func fetchServerData(completion: @escaping (ClusterConfiguratorParameters) -> Void) {
        networkManager.getPOIData(output: Geodata.self) {data in
            let outputData = DataForClusterConfigurator(mapPoints: data.features, buckets: Constants.buckets, colors: Constants.colors, algorithm: ClusterAlgorithm(rawValue: "gridBased") ?? .gridBased)
            completion(outputData)
        }
    }
    
}
