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
}

class ButtonViewController: UIViewController, ButtonViewControllerProtocol {

    @IBOutlet weak var button: UIButton!
    
    var viewModel: ButtonSceneViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.titleLabel?.text = viewModel.buttonText
    }
    
    @IBAction func buttonDidTap(_ sender: UIButton) {
        viewModel.route()
    }
}


//extension ButtonViewController: ViewControllerMakable {
//    
//    func make() -> Self {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        return storyboard.instantiateViewController(withIdentifier: "ButtonViewController") as! ButtonViewController
//    }
//}
