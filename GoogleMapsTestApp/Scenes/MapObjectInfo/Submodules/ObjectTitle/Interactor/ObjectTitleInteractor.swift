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
    
    init(service: ObjectTitleServiceInput) {
        self.service = service
    }
}

extension ObjectTitleInteractor: ObjectTitleServiceOutput {
    
    func didReceiveData(_ data: ObjectTitleDataProtocol) {
        
    }
    
    func didReceiveError(_ error: Error) {
        
    }

}

extension ObjectTitleInteractor: MapObjectInfoInteractorInput {
    
}
