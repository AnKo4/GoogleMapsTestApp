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
    
    func getPOIData<T: Codable>(output structure: T.Type, completion: @escaping (T) -> Void) {
        provider.request(.getPOIData) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                let (decodedData, error) = self.decodeData(data: response.data, to: structure.self)
                switch error {
                case nil:
                    guard let data = decodedData else { return }
                    completion(data)
                default:
                    guard let error = error else { return }
                    print("Error while decoding: \(error.localizedDescription)")
                    print("Decoded data: \(decodedData)")
                }
//                completion(decodedData)
            case.failure(let error):
                print(error.errorDescription ?? "Can't get data from server")
            }
        }
    }
 }
