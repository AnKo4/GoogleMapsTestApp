//
//  ObjectTitleInteractorProtocol.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 27.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol ObjectTitleInteractorProtocol: class {
    var service: ObjectTitleServiceInput { get }
    var presenter: ObjectTitleInteractorOutput? { get set }
    var objectId: Int { get }
}