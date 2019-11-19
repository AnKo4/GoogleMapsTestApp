//
//  GMUComponentFactory.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 15.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

class GMUComponentFactory: GMUComponentFactoryProtocol {
    
    func makeIconGenerator(with parameters: IconGeneratorParametersType) -> GMUClusterIconGenerator {
        guard
            let buckets = parameters.buckets,
            let colors = parameters.colors
            else {
                return GMUDefaultClusterIconGenerator()
        }
        let iconGenerator = GMUDefaultClusterIconGenerator(buckets: buckets, backgroundColors: colors)
        return iconGenerator
    }

}
