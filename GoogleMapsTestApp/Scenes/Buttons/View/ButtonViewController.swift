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
    @IBOutlet weak var rating: Rating!
    
    var viewModel: ButtonSceneViewModelProtocol?


    override func viewDidLoad() {
        super.viewDidLoad()

        configureButton()
        showRating()
    }
    
    private func configureButton() {
        button.titleLabel?.numberOfLines = 0
        button.setTitle(viewModel?.buttonTitle, for: .normal)
    }

    private func showRating() {
        let data = RatingData(value: 2, voicesCount: 3, agency: "IMDB")
        rating.showRating(with: data)
    }
    
    @IBAction func buttonDidTap(_ sender: UIButton) {
        viewModel?.route()
    }
}
