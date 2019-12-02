//
//  ObjectTitleMoyaFakeService.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 29.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation
import Moya

enum ObjectTitleMoyaFakeService {
    case getObjectTitleData(objectId: Int)
}

extension ObjectTitleMoyaFakeService: TargetType {
    var baseURL: URL {
        return URL(string: "https://fakeserver.ru")!
    }
    
    var path: String {
        switch self {
        case .getObjectTitleData:
            return "/object_title"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getObjectTitleData:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .getObjectTitleData(let objectId):
            let data = ObjectTitleFakeDataFactory.data(objectId: objectId)
            guard let encodedData = try? JSONEncoder().encode(data) else { return Data() }
            return encodedData
        }
    }
    
    var task: Task {
        switch self {
        case .getObjectTitleData:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .getObjectTitleData:
            return [:]
        }
    }
    
}
