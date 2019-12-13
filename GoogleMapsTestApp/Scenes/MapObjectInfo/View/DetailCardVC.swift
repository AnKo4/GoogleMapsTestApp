//
//  DetailCardVC.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 13.12.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class DetailCardVC: UIViewController, MapObjectInfoProtocol {

    var presenter: MapObjectInfoPresenterInput?

    @IBOutlet weak var titleView: TitleView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        showData()
    }

     private func showData() {
         titleView.showTitle(title: "Andrey", description: "Kochetkov")
//         ratingView?.showRating(stars: 4, voices: 23, agency: "Tagline")
//         directionsButtonView?.setTitle("5 min drive")
//         let images: [String] = ["image1", "image2", "image3", "image4", "image5", "image6"]
//         photosView?.showPhotos(using: images, on: "TripAdvisor")
//         workingTimeView?.show(title: "Hours", content: "09:00 - 21:00, Open Now")
//         addressView?.show(title: "Address", content: "Moscow, Red Square")
// //        phoneView?.show(title: nil, content: nil)
//         phoneView?.show(title: "Phone", content: "+7 (800) 777-77-77")
//         websiteView?.show(title: "Website", content: "apple.com")
//         reviewsView?.show(title: "What people say", content: nil)
     }
 
     @IBAction private func closeButtonDidTap(_ sender: UIButton) {
         presenter?.closeButtonDidTap()
     }
}

extension DetailCardVC: MapObjectInfoPresenterOutput {
    
}

extension DetailCardVC: MapObjectInfoRouterOutput {
    func close() {
        dismiss(animated: true)
    }
}
