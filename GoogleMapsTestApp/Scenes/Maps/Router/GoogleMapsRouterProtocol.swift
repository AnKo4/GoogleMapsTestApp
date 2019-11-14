//
//  GoogleMapsRouterProtocol.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 14.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol GoogleMapsRouterProtocol: class {
    var view: UIViewController? { get set }
    func showAlert(message: String)
}
