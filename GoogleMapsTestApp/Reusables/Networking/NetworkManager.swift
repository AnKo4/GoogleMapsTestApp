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
                do {
                    let decodedData = try self.decodeData(data: response.data, to: structure.self)
                    completion(decodedData)
                } catch {
                    print("Error while decoding: \(error.localizedDescription)")
                }
            case.failure(let error):
                print(error.errorDescription ?? "Can't get data from server")
            }
        }
    }
 }
