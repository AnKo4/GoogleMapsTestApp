//
//  ClusterConfigurator.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 05.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol ClusterConfiguratorProtocol: class {
    var componentsFactory: GMUComponentFactoryProtocol! { get }
    
    func configureClusterManager(for mapView: GMSMapView, parameters: ClusterConfiguratorParameters ) -> (GMUClusterManager, GMUDefaultClusterRenderer)
}
