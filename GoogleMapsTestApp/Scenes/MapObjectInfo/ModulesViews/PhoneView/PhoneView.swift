//
//  PhoneView.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 09.12.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

class PhoneView: SectionView, SectionViewProtocol {

    func show(title: String?, content: String?) {
        guard (title == nil) && (content == nil) else {
            titleLabel?.text = title
            contentLabel?.text = content
            return
        }
        isHidden = true
    }
}
