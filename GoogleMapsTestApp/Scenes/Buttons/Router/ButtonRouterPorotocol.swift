//
//  MapsRouterPorotocol.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 08.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol ButtonRouterPorotocol: Routable {
    var navController: UINavigationController? { get set }
    func route()
}
