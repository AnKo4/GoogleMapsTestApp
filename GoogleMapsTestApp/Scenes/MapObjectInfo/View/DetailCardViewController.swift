//
//  DetailCardViewController.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 05.12.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

@objc protocol DetailCardProtocol: class {
    var titleView: (UIView & TitleShowable)? { get }
    var ratingView: Rating? { get }
    var directionsButtonView: (UIView & DirectionsShowable)? { get }
    var photosView: (UIView & PhotosShowable)? { get }
    var buttonsPanelView: (UIView & ButtonsPanelProtocol)? { get }
}

class DetailCardViewController: UIViewController, MapObjectInfoProtocol {
    
    @IBOutlet weak var titleView: (UIView & TitleShowable)?
    @IBOutlet weak var ratingView: Rating?
    @IBOutlet weak var directionsButtonView: (UIView & DirectionsShowable)?
    @IBOutlet weak var photosView: PhotosView?
    @IBOutlet weak var buttonsPanelView: (UIView & ButtonsPanelProtocol)?
    
    
    var presenter: MapObjectInfoPresenterInput?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setDirectionButtonDelegate(self)
        setButtonsPanelDelegate(self)
        
        titleView?.showTitle(title: "Andrey", description: "Kochetkov")
        let ratingData = RatingData(stars: 4, voicesCount: 23, agency: "Tagline")
        ratingView?.showRating(with: ratingData)
    }
}

extension DetailCardViewController: MapObjectInfoPresenterOutput {
    
}

extension DetailCardViewController: MapObjectInfoRouterOutput {
    func close() {
        dismiss(animated: true)
    }
}

extension DetailCardViewController: DirectionsButtonOutput {
    func setDirectionButtonDelegate(_ delegate: DirectionsButtonOutput?) {
        
    }
    
    func directionsButtonDidTap() {
        
    }
}

extension DetailCardViewController: ButtonsPanelOutput {
    func setButtonsPanelDelegate(_ delegate: ButtonsPanelOutput?) {
        
    }
    
    func callButtonDidTap() {
        
    }
    
    func websiteButtonDidTap() {
        
    }
    
    func favouriteButtonDidTap() {
        
    }
    
    func shareButtonDidTap() {
        
    }
    
    
}
