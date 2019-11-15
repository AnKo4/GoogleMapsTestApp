//
//  ZoomButton.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 15.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class ZoomButton: UIButton {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.layer.cornerRadius = ButtonSettings.cornerRadius
        self.backgroundColor = ButtonSettings.color
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
    }

    func setTitle(title: String) {
        self.setTitle(title, for: .normal)
    }
}
