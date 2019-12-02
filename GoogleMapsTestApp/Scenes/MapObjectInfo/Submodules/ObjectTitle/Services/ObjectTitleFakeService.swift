//
//  ObjectTitleFakeService.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 29.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation
import Moya

class ObjectTitleFakeService: ObjectTitleServiceProtocol, NetworkDataProviderProtocol {

    private var provider = MoyaProvider<ObjectTitleMoyaFakeService>(stubClosure: MoyaProvider.immediatelyStub)
    var interactor: ObjectTitleServiceOutput?
    
}

extension ObjectTitleFakeService: ObjectTitleServiceInput {
    func fetchObjectTitleData(objectId: Int) {
        print("sending request for ID: \(objectId)")
        provider.request(.getObjectTitleData(objectId: objectId)) { [weak self] result in
            guard let self = self else { return }
            do {
                let data = try self.handleResult(result: result, structure: ObjectTitleData.self)
                self.interactor?.didReceiveData(data)
            } catch {
                self.interactor?.didReceiveError(error)
            }

        }
    }
}
