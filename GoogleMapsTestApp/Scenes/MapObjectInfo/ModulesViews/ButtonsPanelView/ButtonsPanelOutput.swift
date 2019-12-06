//
//  ButtonsPanelOutput.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 06.12.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

@objc protocol ButtonsPanelOutput: class {
    func setButtonsPanelDelegate(_ delegate: ButtonsPanelOutput?)
    func callButtonDidTap()
    func websiteButtonDidTap()
    func favouriteButtonDidTap()
    func shareButtonDidTap()
}
