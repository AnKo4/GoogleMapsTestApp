//
//  NetworkDataProvider.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 01.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol NetworkDataProvider: class {
    func getPOIData<T: Codable>(output structure: T.Type, completion: @escaping (T) -> Void)
}
