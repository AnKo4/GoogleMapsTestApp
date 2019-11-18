//
//  AlertPresenterProtocol.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 18.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol AlertPresenterProtocol: class {
    func present(alert viewController: UIAlertController, animated: Bool)
}
