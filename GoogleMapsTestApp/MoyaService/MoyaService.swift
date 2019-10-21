//
//  MoyaService.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 21.10.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation
import Moya

enum MoyaService {
    case getPOIData
}

extension MoyaService: TargetType {
    
    var baseURL: URL {
        return URL(string: "https://www.mocky.io/v2")!
    }
    
    var path: String {
        switch self {
        case .getPOIData:
            return "/5dadadbc2d0000c33fe4bbe8"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getPOIData:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .getPOIData:
            return Data()
        }
    }
    
    var task: Task {
        switch self {
        case .getPOIData:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return [:]
    }
    
    
}
