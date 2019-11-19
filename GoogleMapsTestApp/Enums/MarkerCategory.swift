//
//  MarkerCategory.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 16.10.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

enum MarkerCategory: String, Codable {
    case human
    case ufo
}

extension MarkerCategory {
    var icon: UIImage? {
        switch self {
        case .human: return UIImage(named: "Body")
        case .ufo: return UIImage(named: "Reproductive")
        }
    }
    
    var iconForSelectedState: UIImage? {
        switch self {
        case .human: return UIImage(named: "Body_selected")
        case .ufo: return UIImage(named: "Reproductive_selected")
        }
    }
}
