//
//  MapViewController.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 31.10.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol MapViewControllerProtocol: class {
    var viewModel: MapViewControllerViewModelProtocol! { get set }
    var clusterConfigurator: ClusterConfiguratorProtocol! { get set }
}
