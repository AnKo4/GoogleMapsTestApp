//
//  MapViewControllerViewModel.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 31.10.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol  GoogleMapsSceneViewModelProtocol: class {
    var view: GoogleMapsViewModelOutput? { get set }
    var router: GoogleMapsRouterProtocol { get set }
    
    func fetchLocalData()
    func fetchServerData()
    func markerDidSelected(objectId: Int)
}
