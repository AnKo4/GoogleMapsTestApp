//
//  ButtonSceneModule.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 08.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

struct ButtonSceneModule: BaseModuleProtocol {

    var view: UIViewController & ButtonViewControllerProtocol
    
    init(buttonText: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.view = storyboard.instantiateViewController(withIdentifier: "ButtonViewController") as! ButtonViewController
        let router = ButtonRouter(navigationController: self.view.navigationController)
        let viewModel = ButtonSceneViewModel(router: router, buttonText: buttonText)
        self.view.viewModel = viewModel
    }
}
