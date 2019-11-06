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
//            let convertedData = self.convertToMapPoinType(data: data.features)
            completion(data.features, [4, 5, 6, 8, 10], [.red, .blue, .cyan, .gray, .green], .gridBased)
        }
    }
    
    private func convertToMapPoinType(data: [Feature]) -> [MapPointType] {
        var convertedData: [MapPointType] = []
        
        for item in data {
            let mapPoint = MapPoint(lat: item.geometry.coordinates[1], long: item.geometry.coordinates[0], name: item.properties.title, snippet: item.properties.snippet, category: MarkerCategory(rawValue: item.properties.category) ?? MarkerCategory.human)
            convertedData.append(mapPoint)
        }
        return convertedData
    }
    
}
