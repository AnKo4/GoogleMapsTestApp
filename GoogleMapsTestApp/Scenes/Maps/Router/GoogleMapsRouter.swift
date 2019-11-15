//
//  GoogleMapsRouter.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 14.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

class GoogleMapsRouter: GoogleMapsRouterProtocol {
    
    var view: UIViewController?
    
    init(view: UIViewController?) {
        self.view = view
    }
    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Ошибка!", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        view?.present(alertController, animated: true, completion: nil)
    }

}
