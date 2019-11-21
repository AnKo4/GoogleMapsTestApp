//
//  HasAbilityToPresent.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 21.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol HasAbilityToPresent: class {
    func show(viewController: UIViewController, animated: Bool)
}
