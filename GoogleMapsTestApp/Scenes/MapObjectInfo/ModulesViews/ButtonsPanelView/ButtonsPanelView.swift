//
//  ButtonsPanelView.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 06.12.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class ButtonsPanelView: UIView, NibLoadable, NibConfigurable, ButtonsPanelProtocol {

    @IBOutlet weak private var callButton: UIButton?
    @IBOutlet weak private var websiteButton: UIButton?
    @IBOutlet weak private var favouriteButton: UIButton?
    @IBOutlet weak private var shareButton: UIButton?
    
    @IBOutlet private var buttons: [UIButton]?
    
    weak var delegate: ButtonsPanelOutput?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        configureButtons()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
        configureButtons()
    }
    
    private func configureButtons() {
        guard let buttons = buttons else { return }
        for button in buttons {
            button.layer.cornerRadius = 5
        }
    }
    
    @IBAction private func callButtonDidTap(_ sender: UIButton) {
        delegate?.callButtonDidTap()
    }
    
    @IBAction private func websiteButtonDidTap(_ sender: UIButton) {
        delegate?.websiteButtonDidTap()
    }
    
    @IBAction private func favouritesButtonDidTap(_ sender: UIButton) {
        delegate?.favouriteButtonDidTap()
    }
    
    @IBAction private func shareButtonDidTap(_ sender: UIButton) {
        delegate?.shareButtonDidTap()
    }
    
}
