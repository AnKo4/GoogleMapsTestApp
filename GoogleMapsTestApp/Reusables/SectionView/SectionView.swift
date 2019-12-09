//
//  SectionView.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 09.12.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class SectionView: UIView, SectionViewProtocol {

    @IBOutlet weak var separator: UIView!
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var contentLabel: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromNib(nibName: "SectionView")
        separator.backgroundColor = .lightGray
    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadFromNib(nibName: "SectionView")
        separator.backgroundColor = .lightGray
    }
    
    func show(title: String?, content: String?) {
        guard (title == nil) && (content == nil) else {
            titleLabel?.text = title
            contentLabel?.text = content
            return
        }
        isHidden = true
    }
}
