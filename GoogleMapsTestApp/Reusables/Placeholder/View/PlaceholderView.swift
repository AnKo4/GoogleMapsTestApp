//
//  PlaceholderView.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 04.12.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class PlaceholderView: UIView {

    @IBOutlet private weak var label: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
//        fatalError("init(coder:) has not been implemented")
    }
    
    private func loadFromNib() -> UIView {
        guard let view = UINib(nibName: "Rating", bundle: Bundle(for: type(of: self))).instantiate(withOwner: self, options: nil).first as? UIView else { return UIView() }
        return view
    }
    
    private func configureView() {
        let view = loadFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.isHidden = true
        addSubview(view)
    }
    
    func setBackground(_ color: UIColor) {
        self.backgroundColor = color
    }
    
    func setTextColor(_ color: UIColor) {
        label.textColor = color
    }
    
    func showMessage(_ message: String) {
        label.text = message
    }
}

protocol PlaceholderShowable {
    var placeholder: PlaceholderView? { get set }
    func showPlaceholder(message: String, backgroundColor: UIColor, textColor: UIColor)
    func hidePlaceholder()
}

extension PlaceholderShowable where Self: UIView {
    mutating func showPlaceholder(message: String, backgroundColor: UIColor = .white, textColor: UIColor = .black) {
        placeholder = PlaceholderView()
        guard let placeholder = placeholder else { return }
        placeholder.setBackground(backgroundColor)
        placeholder.setTextColor(textColor)
        placeholder.showMessage(message)
        addSubview(placeholder)
    }
    
    func hidePlaceholder() {
        placeholder?.removeFromSuperview()
    }
}

extension PlaceholderShowable where Self: UIViewController {
    mutating func showPlaceholder(message: String, backgroundColor: UIColor = .white, textColor: UIColor = .black) {
        placeholder = PlaceholderView()
        guard let placeholder = placeholder else { return }
        placeholder.setBackground(backgroundColor)
        placeholder.setTextColor(textColor)
        placeholder.showMessage(message)
        view.addSubview(placeholder)
    }
    
    func hidePlaceholder() {
        placeholder?.removeFromSuperview()
    }
}
