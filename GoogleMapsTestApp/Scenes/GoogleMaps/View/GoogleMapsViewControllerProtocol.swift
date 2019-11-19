//
//  MapViewController.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 31.10.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol GoogleMapsViewControllerProtocol: class {
    var viewModel: GoogleMapsSceneViewModelProtocol! { get set }
    var clusterConfigurator: ClusterConfiguratorProtocol! { get set }
}
