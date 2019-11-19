//
//  GoogleMapsViewModelOutput.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 13.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol GoogleMapsViewModelOutput: class {
    func showLocalData(_ data: ClusterConfiguratorParameters)
    func showNetworkData(_ data: ClusterConfiguratorParameters)
}
