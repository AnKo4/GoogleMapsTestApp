//
//  GoogleMapsViewModel.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 28.10.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

struct GoogleMapsViewModel: MapViewControllerViewModel {
        
    private var networkManager: NetworkDataProvider
    private var localDataSource: ClusterConfiguratorDataSource
    
    
    init(localDataSource: ClusterConfiguratorDataSource, networkManager: NetworkDataProvider) {
        self.localDataSource = localDataSource
        self.networkManager = networkManager
    }
    
    func fetchLocalData() -> ([MapPointType], [NSNumber]?, [UIColor]?, ClusterAlgorithm) {
        return (localDataSource.mapPoints, nil, nil, .distanceBased)
    }
    
    func fetchServerData(completion: @escaping ([MapPointType], [NSNumber]?, [UIColor]?, ClusterAlgorithm) -> Void) {
        networkManager.getPOIData(output: Geodata.self) {data in
            completion(data.features, Constants.buckets, Constants.colors, .gridBased)
        }
    }
    
}
