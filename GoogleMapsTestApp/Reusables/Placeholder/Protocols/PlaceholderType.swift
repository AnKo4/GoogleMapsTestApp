//
//  PlaceholderType.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 04.12.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol PlaceholderType {
    func setBackground(_ color: UIColor?)
    func setTextColor(_ color: UIColor?)
    func showMessage(_ message: String)
}
