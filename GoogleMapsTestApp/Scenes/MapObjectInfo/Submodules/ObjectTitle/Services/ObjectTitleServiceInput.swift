//
//  ObjectTitleServiceInput.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 29.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol ObjectTitleServiceInput: class {
    func fetchObjectTitleData(objectId: Int)
}
