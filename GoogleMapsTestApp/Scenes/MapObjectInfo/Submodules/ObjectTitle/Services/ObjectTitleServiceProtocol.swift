//
//  ObjectTitleServiceProtocol.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 29.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation
import Moya

protocol ObjectTitleServiceProtocol: class {
    var interactor: ObjectTitleServiceOutput? { get set }
}
