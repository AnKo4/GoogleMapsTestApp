//
//  StartViewController.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 31.10.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class ButtonViewController: UIViewController, ButtonViewControllerProtocol {

    @IBOutlet weak var button: UIButton!
    
    var viewModel: ButtonSceneViewModelProtocol?


    override func viewDidLoad() {
        super.viewDidLoad()

        configureButton()
    }
    
    private func configureButton() {
        button.titleLabel?.numberOfLines = 0
        button.setTitle(viewModel?.buttonTitle, for: .normal)
    }

    @IBAction func buttonDidTap(_ sender: UIButton) {
        viewModel?.route()
    }
}
