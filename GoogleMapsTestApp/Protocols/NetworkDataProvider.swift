//
//  NetworkDataProvider.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 01.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol NetworkDataProvider: class {
    func getPOIData(completion: @escaping ([Feature]) -> Void)
}
