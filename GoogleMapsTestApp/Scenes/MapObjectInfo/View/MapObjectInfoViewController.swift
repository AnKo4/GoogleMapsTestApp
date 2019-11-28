//
//  MapObjectInfoViewController.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 21.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class MapObjectInfoViewController: UIViewController, ModulesHolderProtocol, MapObjectInfoProtocol {

    @IBOutlet weak var modulesStack: UIStackView!
    
    var presenter: MapObjectInfoPresenterInput?
    var modules: [UIView] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    private func configureView() {
        self.view.layer.cornerRadius = 5
        addModules()
    }
    
    func addModules() {
        for module in modules {
            modulesStack.addArrangedSubview(module)
        }
    }

    @IBAction private func closeButtonTapped(_ sender: UIButton) {
        presenter?.closeButtonDidTap()
    }
}

extension MapObjectInfoViewController: MapObjectInfoPresenterOutput {
    
}

extension MapObjectInfoViewController: MapObjectInfoRouterOutput {
    func close() {
        dismiss(animated: true)
    }
}
