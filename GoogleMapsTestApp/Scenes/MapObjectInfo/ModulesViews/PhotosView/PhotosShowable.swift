//
//  PhotosShowable.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 06.12.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

@objc protocol PhotosShowable: class {
    var data: [String] { get set }

    func showPhotos(using data: [String], on photosProvider: String?)
}
