//
//  ObjectTitlePresenterProtocol.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 27.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol ObjectTitlePresenterProtocol: class {
    var view: ObjectTitlePresenterOutput { get }
    var interactor: ObjectTitleInteractorInput { get }
    var externalPresenter: ExternalPresenterInput { get }
}
