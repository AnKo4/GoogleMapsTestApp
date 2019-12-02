//
//  MapObjectInfoSubmodulesFactory.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 28.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

class MapObjectInfoSubmodulesFactory: MapObjectInfoSubmodulesFactoryProtocol {
    func makeModules(with externalPresenter: ExternalPresenterInput, objectId: Int) -> [UIView] {
        var modules: [UIView] = []

        let objectTitleModule = ObjectTitleModule(with: externalPresenter, objectId: objectId)
        modules.append(objectTitleModule.view)
        return modules
    }
}
