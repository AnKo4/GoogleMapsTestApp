//
//  ObjectTitleOutputProtocol.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 26.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol ObjectTitlePresenterOutput: class {
    func showObjectTitle(_ title: String)
    func showObjectDescription(_ description: String)
    func showObjectRarting(_ rating: RatingInfo)
    func showDistanceButtonTitle(_ title: String)
    func showPlaceholder(with message: String)
}
