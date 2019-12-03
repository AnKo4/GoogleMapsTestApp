//
//  ObjectTitlePresenter.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 27.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

class ObjectTitlePresenter: ObjectTitlePresenterProtocol {
    
    var view: ObjectTitlePresenterOutput
    var interactor: ObjectTitleInteractorInput
    var externalPresenter: ExternalPresenterInput

    
    init(view: ObjectTitlePresenterOutput, interactor: ObjectTitleInteractorInput,
         externalPresenter: ExternalPresenterInput) {
        self.view = view
        self.interactor = interactor
        self.externalPresenter = externalPresenter
    }
}

extension ObjectTitlePresenter: ObjectTitleInteractorOutput {

    func interactorDidFetchData(_ data: ObjectTitleDataProtocol) {
        view.showObjectTitle(data.objectTitle)
        view.showObjectDescription(data.objectDescription)
        view.showObjectRarting(data.objectRating)
        view.showDistanceButtonTitle(data.distanceButtonTitle)
    }
    
    func interactorDidReceiveError(_ error: Error) {
        view.showPlaceholder(with: error.localizedDescription)
    }
}

extension ObjectTitlePresenter: ObjectTitlePresenterInput {
    func viewCompletedConfiguration() {
        interactor.viewNeedsData()
    }
}
