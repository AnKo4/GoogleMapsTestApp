//
//  DetailCardViewController.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 05.12.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

@objc protocol DetailCardProtocol: class {
    var titleView: TitleShowable? { get }
    var ratingView: RatingOutletProtocol? { get }
    var directionsButtonView: DirectionsShowable? { get }
    var photosView: PhotosShowable? { get }
    var buttonsPanelView: ButtonsPanelProtocol? { get }
    var workingTimeView: SectionViewWithButtonProtocol? { get }
    var addressView: SectionViewProtocol? { get }
    var phoneView: SectionViewProtocol? { get }
    var websiteView: SectionViewProtocol? { get }
    var reviewsView: (SectionViewWithButtonProtocol & SectionViewWithButtonOutputable)? { get }
    
}

class DetailCardViewController: UIViewController, MapObjectInfoProtocol, DetailCardProtocol {

    @IBOutlet weak var titleView: TitleShowable?
    @IBOutlet weak var ratingView: RatingOutletProtocol?
    @IBOutlet weak var directionsButtonView: DirectionsShowable?
    @IBOutlet weak var photosView: PhotosShowable?
    @IBOutlet weak var buttonsPanelView: ButtonsPanelProtocol?
    @IBOutlet weak var workingTimeView: SectionViewWithButtonProtocol?
    @IBOutlet weak var addressView: SectionViewProtocol?
    @IBOutlet weak var phoneView: SectionViewProtocol?
    @IBOutlet weak var websiteView: SectionViewProtocol?
    @IBOutlet weak var reviewsView: (SectionViewWithButtonProtocol & SectionViewWithButtonOutputable)?
    
    
    var presenter: MapObjectInfoPresenterInput?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8).cgColor
        setDirectionButtonDelegate(self)
        setButtonsPanelDelegate(self)
        setSectionViewWithButtonDelegate(self)
        
        titleView?.showTitle(title: "Andrey", description: "Kochetkov")
        ratingView?.showRating(stars: 4, voices: 23, agency: "Tagline")
        workingTimeView?.setButtonTitle("Show All")
        workingTimeView?.show(title: "Hours", content: "09:00 - 21:00, Open Now")
    }
    
    @IBAction func closeButtonDidTap(_ sender: UIButton) {
        print("close!")
        presenter?.closeButtonDidTap()
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
        directionsButtonView?.delegate = delegate
    }
    
    func directionsButtonDidTap() {
        
    }
}

extension DetailCardViewController: ButtonsPanelOutput {
    func setButtonsPanelDelegate(_ delegate: ButtonsPanelOutput?) {
        buttonsPanelView?.delegate = delegate
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

extension DetailCardViewController: SectionViewWithButtonOutput {
    func setSectionViewWithButtonDelegate(_ delegate: SectionViewWithButtonOutput?) {
        reviewsView?.delegate = delegate
    }
    
    func sectionButtonDidTap() {
        
    }
}
