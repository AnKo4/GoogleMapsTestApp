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
    
    
    func fetchLocalData() -> [MapPointType] {
        return localDataSource.mapPoints
    }
    
    func fetchServerData(completion: @escaping ([MapPointType]) -> Void) {
        networkManager.getPOIData() {data in
            let convertedData = self.convertToMapPoinType(data: data)
            completion(convertedData)
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


    
    
    
    
    

 
    
//    func configureClusterManagerFromNetwork(for mapView: GMSMapView) -> (GMUClusterManager, GMUDefaultClusterRenderer) {
//        let iconGenerator = GMUDefaultClusterIconGenerator(buckets: [4, 5, 6, 8, 10], backgroundColors: [.red, .blue, .cyan, .gray, .green])
//        let algorithm = GMUGridBasedClusterAlgorithm()
//        let renderer = GMUDefaultClusterRenderer(mapView: mapView, clusterIconGenerator: iconGenerator)
//        
//        let clusterManager = GMUClusterManager(map: mapView, algorithm: algorithm, renderer: renderer)
//        clusterItemGenerator.prepareItemsFromNetwork(for: clusterManager)
//           
//        return (clusterManager, renderer)
//    }
    
}
