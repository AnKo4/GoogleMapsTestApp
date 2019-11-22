//
//  ViewControllerPresenterHolder.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 21.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol ViewControllerPresenterHolder: class {
    var controllerPresenter: HasAbilityToPresent? { get }
}
