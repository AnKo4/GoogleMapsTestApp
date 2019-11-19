//
//  AlertShowable.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 18.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol AlertShowable {
    func showAlert(with message: String)
}

extension AlertShowable where Self: AlertPresenterHolder {
    
    func showAlert(with message: String) {
        let alertController = UIAlertController(title: "Ошибка!", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        alertPresenter?.present(alert: alertController, animated: true)
    }
}
