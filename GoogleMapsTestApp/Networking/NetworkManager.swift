//
//  NetworkManager.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 21.10.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation
import Moya

class NetworkManager: NetworkDataProvider {
    
    private let provider = MoyaProvider<MoyaService>()
    
    
    func getPOIData(completion: @escaping ([Feature]) -> Void) {
        provider.request(.getPOIData) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                guard let decodedData = self.decodeData(data: response.data, to: Geodata.self) else { return }
                completion(decodedData.features)
            case.failure(let error):
                print(error.errorDescription ?? "Can't get data from server")
            }
        }
    }
    
    private func decodeData<T: Codable>(data: Data, to structure: T.Type) -> T? {
         guard let decodedData = try? JSONDecoder().decode(structure.self, from: data) else {
             print("Something gone wrong while decoding...")
             return nil
         }
         return decodedData
     }
}
