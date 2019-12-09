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

class DetailCardViewController: UIViewController, MapObjectInfoProtocol, DetailCardProtocol, PlaceholderContainerType {

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
    
    var placeholder: UIView?
    var presenter: MapObjectInfoPresenterInput?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        setDelegates()
        showData()
    }
    
    private func configureView() {
        view.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8).cgColor
        workingTimeView?.setButtonTitle("Show All")
        reviewsView?.setButtonTitle("Open TripAdvisor")
    }
    
    private func setDelegates() {
        setDirectionButtonDelegate(self)
        setButtonsPanelDelegate(self)
        setSectionViewWithButtonDelegate(self)
    }
    
    
    // Function for testing
    private func showData() {
        titleView?.showTitle(title: "Andrey", description: "Kochetkov")
        ratingView?.showRating(stars: 4, voices: 23, agency: "Tagline")
        directionsButtonView?.setTitle("5 min drive")
        let images: [String] = ["image1", "image2", "image3", "image4", "image5", "image6"]
        photosView?.showPhotos(using: images, on: "TripAdvisor")
        workingTimeView?.show(title: "Hours", content: "09:00 - 21:00, Open Now")
        addressView?.show(title: "Address", content: "Moscow, Red Square")
//        phoneView?.show(title: nil, content: nil)
        phoneView?.show(title: "Phone", content: "+7 (800) 777-77-77")
        websiteView?.show(title: "Website", content: "apple.com")
        reviewsView?.show(title: "What people say", content: nil)
    }
    
    @IBAction private func closeButtonDidTap(_ sender: UIButton) {
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
