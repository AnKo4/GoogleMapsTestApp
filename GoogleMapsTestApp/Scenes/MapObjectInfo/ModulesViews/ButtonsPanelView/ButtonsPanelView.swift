//
//  ButtonsPanelView.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 06.12.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class ButtonsPanelView: UIView, ButtonsPanelProtocol {

    @IBOutlet weak private var callButton: UIButton?
    @IBOutlet weak private var websiteButton: UIButton?
    @IBOutlet weak private var favouriteButton: UIButton?
    @IBOutlet weak private var shareButton: UIButton?
    
    @IBOutlet private var buttons: [UIButton]?
    
    weak var delegate: ButtonsPanelOutput?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromNib(nibName: "ButtonsPanelView")
//        configureView()
        configureButtons()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadFromNib(nibName: "ButtonsPanelView")
//        configureView()
        configureButtons()
    }

//    private func loadFromNib() -> UIView {
//        guard let view = UINib(nibName: "ButtonsPanelView", bundle: Bundle(for: type(of: self))).instantiate(withOwner: self, options: nil).first as? UIView else { return UIView() }
//        return view
//    }
//
//    private func configureView() {
//        let view = loadFromNib()
//        view.frame = bounds
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        addSubview(view)
//    }
    
    private func configureButtons() {
        guard let buttons = buttons else { return }
        for button in buttons {
            button.layer.cornerRadius = 5
            button.arrangeTitleComponents()
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
