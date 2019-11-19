//
//  GMUComponentFactoryProtocol.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 15.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol GMUComponentFactoryProtocol {
    func makeIconGenerator(with parameters: IconGeneratorParametersType) -> GMUClusterIconGenerator
}
