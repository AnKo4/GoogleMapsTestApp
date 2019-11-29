//
//  NetworkManager.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 21.10.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation
import Moya


class GoogleMapsNetworkManager: GoogleMapsNetworkDataProvider {
        
    func fetchGooglePOIData(completion: @escaping (Geodata?, Error?) -> Void) {
        provider.request(.getPOIData) { result in
            do {
                let data = try self.handleResult(result: result, structure: Geodata.self)
                completion(data, nil)
            } catch {
                completion(nil, error)
            }
        }
    }
}
