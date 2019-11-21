//
//  ViewControllerPresentable.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 21.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol ViewControllerPresentable: class {
    func showViewController()
}

extension ViewControllerPresentable where Self: ViewControllerPresenterHolder {
    func showViewController() {
        let controller = MapObjectInfoViewController(nibName: MapObjectInfoViewController.id, bundle: nil)
        viewControllerPresenter?.show(viewController: controller, animated: true)
    }
}
