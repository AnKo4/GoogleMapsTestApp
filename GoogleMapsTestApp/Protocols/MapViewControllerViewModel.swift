//
//  MapViewControllerViewModel.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 31.10.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol GoogleMapsViewModelOutput: class {
    func showLocalData(data: ClusterConfiguratorParameters)
    func showNetworkData(data: ClusterConfiguratorParameters)
}

protocol  MapViewControllerViewModel {
    var view: GoogleMapsViewModelOutput? { get set }
    
    func fetchLocalData()
    func fetchServerData()
}
