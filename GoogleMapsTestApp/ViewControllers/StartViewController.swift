//
//  StartViewController.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 31.10.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class StartViewController: UIViewController, Routable {
 
    var router: Router!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        router = RouterToGoogleMapsViewController()
    }
    
    @IBAction func buttonDidTap(_ sender: UIButton) {
        router.route(from: self)
    }
}
