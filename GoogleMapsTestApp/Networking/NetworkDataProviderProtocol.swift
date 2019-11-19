//
//  NetworkDataProvider.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 01.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation
import Moya

protocol NetworkDataProviderProtocol: class {
    
}

extension NetworkDataProviderProtocol {
    
    func decodeData<T: Codable>(data: Data, to structure: T.Type) throws -> T {
        do {
            let decodedData = try JSONDecoder().decode(structure.self, from: data)
            return decodedData
        } catch {
            throw error
        }
     }
    
    func handleResult<T: Codable>(result: Result<Moya.Response, MoyaError>, structure: T.Type) throws -> T {
        switch result {
        case .success(let response):
                return try decodeData(data: response.data, to: structure.self)
        case.failure(let error):
            throw error
        }
    }

}