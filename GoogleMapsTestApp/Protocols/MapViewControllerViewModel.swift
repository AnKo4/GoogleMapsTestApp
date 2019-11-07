//
//  MapViewControllerViewModel.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 31.10.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol  MapViewControllerViewModel {
    func fetchLocalData() -> ClusterConfiguratorParameters
    func fetchServerData(completion: @escaping (ClusterConfiguratorParameters) -> Void)
}
