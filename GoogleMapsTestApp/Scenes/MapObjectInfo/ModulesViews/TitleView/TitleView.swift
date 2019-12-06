//
//  TitleView.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 06.12.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class TitleView: UIView, NibLoadable, NibConfigurable, TitleShowable {
    
    @IBOutlet weak internal var titleLabel: UILabel?
    @IBOutlet weak internal var descriptionLabel: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }
    
    func showTitle(title: String?, description: String?) {
        guard (title == nil) && (description == nil) else {
            titleLabel?.text = title
            descriptionLabel?.text = description
            return
        }
        isHidden = true
    }
}
