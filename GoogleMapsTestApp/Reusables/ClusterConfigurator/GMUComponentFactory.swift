//
//  GMUComponentFactory.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 15.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

class GMUComponentFactory: GMUComponentFactoryProtocol {
    
    func makeIconGenerator(buckets: [NSNumber]?, colors: [UIColor]?) -> GMUClusterIconGenerator {
        guard
            let buckets = buckets, let colors = colors,
            buckets.count != 0,
            buckets.count == colors.count
            else {
                return GMUDefaultClusterIconGenerator()
        }
        let iconGenerator = GMUDefaultClusterIconGenerator(buckets: buckets, backgroundColors: colors)
        return iconGenerator
    }

}
