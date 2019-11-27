//
//  ViewControllerPresentable.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 21.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

protocol ViewControllerPresentable: class {
    func showObjectInfo()
}

//extension ViewControllerPresentable where Self: ViewControllerPresenterHolder {
//    func showObjectInfo() {
//        let controller = MapObjectInfoViewController(nibName: MapObjectInfoViewController.id, bundle: nil)
//        controllerPresenter?.show(viewController: controller, animated: true)
//    }
//}
