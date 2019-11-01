//
//  StartViewController.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 31.10.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func buttonDidTap(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let controller = storyboard.instantiateViewController(withIdentifier: "MapVC") as? GoogleMapViewController else {
            return
        }
        let networkManager = NetworkManager()
        let dataSource = MockCoordinates()
        let clusterGenerator = ClusterItemsGenerator(networkManager: networkManager, dataSource: dataSource)
        let viewModel = GoogleMapsViewModel(clusterGenerator: clusterGenerator)
        controller.viewModel = viewModel
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
  

}
