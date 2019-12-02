//
//  ObjectTitleInteractor.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 27.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

class ObjectTitleInteractor: ObjectTitleInteractorProtocol {
    var service: ObjectTitleServiceInput
    var presenter: ObjectTitleInteractorOutput?
    var objectId: Int
    
    init(service: ObjectTitleServiceInput, objectId: Int) {
        self.service = service
        self.objectId = objectId
        print("ID = \(self.objectId)")
    }
}

extension ObjectTitleInteractor: ObjectTitleServiceOutput {
    
    func didReceiveData(_ data: ObjectTitleDataProtocol) {
        print("data = \(data)")
        presenter?.interactorDidFetchData(data)
    }
    
    func didReceiveError(_ error: Error) {
        presenter?.interactorDidReceiveError(error)
    }

}

extension ObjectTitleInteractor: ObjectTitleInteractorInput {
    func viewNeedsData() {
        print("service = \(service)")
        service.fetchObjectTitleData(objectId: objectId)
    }
}
