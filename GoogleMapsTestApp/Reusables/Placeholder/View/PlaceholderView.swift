//
//  PlaceholderView.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 04.12.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class PlaceholderView: UIView, PlaceholderType {
    
    var label: UILabel?

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    private func configureView() {
        frame = bounds
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
        configureLabel()
        addButton()
    }
    
    private func addButton() {
        let  button = UIButton(frame: CGRect(x: 10, y: 10, width: 100, height: 50))
        button.backgroundColor = .white
        button.setTitle("CLICK!", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self.superview, action: #selector(closePlaceholder), for: .touchUpInside)
        addSubview(button)
    }
    
    @objc func closePlaceholder() {
        guard let superView = superview as? (UIView & PlaceholderShowable) else { return }
        superView.hidePlaceholder()
//        backgroundColor = .clear
    }
    
    private func configureLabel() {
        label = UILabel()
        guard let label = label else { return }
        label.frame = self.bounds
        label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        label.numberOfLines = 0
        label.textAlignment = .center
        addSubview(label)
    }
    
    func setBackground(_ color: UIColor?) {
        self.backgroundColor = color
    }
    
    func setTextColor(_ color: UIColor?) {
        label?.textColor = color
    }
    
    func showMessage(_ message: String) {
        label?.text = message
    }
}
