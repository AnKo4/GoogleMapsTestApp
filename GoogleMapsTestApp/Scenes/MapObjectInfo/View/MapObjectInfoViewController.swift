//
//  MapObjectInfoViewController.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 21.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class MapObjectInfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.layer.cornerRadius = 5
    }

    @IBAction func closeButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
