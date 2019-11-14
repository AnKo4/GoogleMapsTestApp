//
//  GoogleMapsNetworkDataProviderProtocol.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 14.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation
import Moya

protocol GoogleMapsNetworkDataProviderProtocol: class {
    func fetchGooglePOIData(completion: @escaping (Geodata?, Error?) -> Void)
}

extension GoogleMapsNetworkDataProviderProtocol {
    var provider: MoyaProvider<MoyaService> {
        return MoyaProvider<MoyaService>()
    }

}
