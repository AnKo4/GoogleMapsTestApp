//
//  DetailCardViewController.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 05.12.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class DetailCardViewController: UIViewController, MapObjectInfoProtocol {
    var presenter: MapObjectInfoPresenterInput?
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension DetailCardViewController: MapObjectInfoPresenterOutput {
    
}

extension DetailCardViewController: MapObjectInfoRouterOutput {
    func close() {
        dismiss(animated: true)
    }
}
