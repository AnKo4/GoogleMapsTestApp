//
//  MapObjectinfoPresenterInput.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 28.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol MapObjectInfoPresenterInput: class {
    func closeButtonDidTap()
}

extension MapObjectInfoPresenterInput where Self: MapObjectInfoPresenterProtocol {
    func closeButtonDidTap() {
        router.popMapsObjectInfo()
    }
}
