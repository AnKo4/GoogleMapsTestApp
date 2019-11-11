//
//  StartViewController.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 31.10.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

protocol ButtonViewControllerProtocol: class {
    var viewModel: ButtonSceneViewModelProtocol! { get set }
    func setButtonText()
}

class ButtonViewController: UIViewController/*, ButtonViewControllerProtocol*/ {

    @IBOutlet weak var button: UIButton!
    
//    var viewModel: ButtonSceneViewModelProtocol!
    var router: ButtonRouterPorotocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        router = ButtonRouter(navigationController: self.navigationController)

    }
    
//    func setButtonText() {
//        button.titleLabel?.text = viewModel.buttonText
//    }
    
    
    @IBAction func buttonDidTap(_ sender: UIButton) {
        router.route()
//        viewModel.route()
    }
}
