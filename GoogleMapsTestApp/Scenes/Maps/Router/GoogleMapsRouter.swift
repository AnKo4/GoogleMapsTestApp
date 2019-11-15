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

typealias AlertPresentable = AlertShowable & AlertPresenterHolder

protocol AlertShowable {
    func showAlert(with message: String)
}

protocol AlertPresenterHolder {
    var alertPresenter: AlertPresenterProtocol? { get }
}

extension AlertShowable where Self: AlertPresenterHolder {
    
    func showAlert(with message: String) {
        let alertController = UIAlertController(title: "Ошибка!", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        alertPresenter?.present(alert: alertController, animated: true)
    }
}


protocol AlertPresenterProtocol: class {
    func present(alert viewController: UIAlertController, animated: Bool)
}


extension UIViewController: AlertPresenterProtocol {
    
    func present(alert viewController: UIAlertController, animated: Bool) {
        present(viewController, animated: animated)
    }
    
}
