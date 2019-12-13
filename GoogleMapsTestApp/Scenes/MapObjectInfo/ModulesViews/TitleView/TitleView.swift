//
//  TitleView.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 06.12.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class TitleView: UIView {
    
    @IBOutlet weak private var titleLabel: UILabel?
    @IBOutlet weak private var descriptionLabel: UILabel?
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        loadFromNib(nibName: "TitleView")
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        loadFromNib(nibName: "TitleView")
//    }
        
    func showTitle(title: String?, description: String?) {
        guard (title == nil) && (description == nil) else {
            titleLabel?.text = title
            descriptionLabel?.text = description
            return
        }
        isHidden = true
    }
}
