//
//  MapObjectInfoSubmodulesFactory.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 28.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

class MapObjectInfoSubmodulesFactory: MapObjectInfoSubmodulesFactoryProtocol {
    func makeModules() -> [UIView] {
        var modules: [UIView] = []

        let objectTitleModule = ObjectTitleModule()
        modules.append(objectTitleModule.view)
        return modules
    }
}
