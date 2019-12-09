//
//  ObjectTitleInteractorOutput.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 29.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol ObjectTitleInteractorOutput: class {
    func interactorDidFetchData(_ data: ObjectTitleDataProtocol)
    func interactorDidReceiveError(_ error: Error)
}
