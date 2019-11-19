//
//  GoogleMapsRouter.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 14.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

class GoogleMapsRouter: GoogleMapsRouterProtocol {
    
    weak var alertPresenter: AlertPresenterProtocol?
    
    init(presenter: AlertPresenterProtocol) {
        self.alertPresenter = presenter
    }

}
