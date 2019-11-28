//
//  ObjectTitlePresenter.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 27.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol ObjectTitlePresenterProtocol: class {
    var view: ObjectTitlePresenterOutput? { get }
    var interactor: ObjectTitleInteractorProtocol? { get }
    var router: ObjectTitleRouterProtocol? { get }
    func interactorDidFetchData(_ data: ObjectTitleDataProtocol)
    
}

class ObjectTitlePresenter: ObjectTitlePresenterProtocol {

    var view: ObjectTitlePresenterOutput?
    var interactor: ObjectTitleInteractorProtocol?
    var router: ObjectTitleRouterProtocol?

    
    init(interactor: ObjectTitleInteractorProtocol, router: ObjectTitleRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func interactorDidFetchData(_ data: ObjectTitleDataProtocol) {
        view?.showObjectTitle(data.objectTitle)
        view?.showObjectDescription(data.objectDescription)
        view?.showObjectRarting(data.objectRating)
        view?.showDistanceButtonTitle(data.distanceButtonTitle)
    }
}
