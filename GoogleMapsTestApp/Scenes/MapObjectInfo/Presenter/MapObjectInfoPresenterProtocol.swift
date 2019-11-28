//
//  MapObjectInfoPresenterProtocol.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 27.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol MapObjectInfoPresenterProtocol: class {
    var router: MapObjectInfoRouterInput { get }
    var interactor: MapObjectInfoInteractorInput { get }
}
