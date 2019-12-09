//
//  ObjectTitleServiceOutput.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 29.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol ObjectTitleServiceOutput: class {
    func didReceiveData(_ data: ObjectTitleDataProtocol)
    func didReceiveError(_ error: Error)
}
