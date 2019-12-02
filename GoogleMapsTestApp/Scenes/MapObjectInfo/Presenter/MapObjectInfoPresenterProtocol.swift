//
//  MapObjectInfoPresenterProtocol.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 27.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol MapObjectInfoPresenterProtocol: class {
    var view: MapObjectInfoPresenterOutput { get }
    var router: MapObjectInfoRouterInput & AlertShowable { get }
    var interactor: MapObjectInfoInteractorInput { get }
}
