//
//  ExternalPresenterInput.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 02.12.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol ExternalPresenterInput: class {
    func submoduleDidReceiveError(_ error: Error)
}
