//
//  MapViewControllerViewModel.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 31.10.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol  MapViewControllerViewModel {
    func fetchLocalData() -> ([MapPointType], [NSNumber]?, [UIColor]?, ClusterAlgorithm)
    func fetchServerData(completion: @escaping ([MapPointType], [NSNumber]?, [UIColor]?, ClusterAlgorithm) -> Void)
}
