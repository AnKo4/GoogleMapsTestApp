//
//  UIButtonExtensions.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 06.12.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

extension UIButton {
    func arrangeTitleComponents() {
        let topImageInset = (self.frame.height / 2) - (self.imageView?.frame.height ?? 0)
        let bottomImageInset = self.frame.height / 2
        let leftImageInset = (self.frame.width - (self.imageView?.frame.width ?? 0)) / 2
        let rightImageInset = leftImageInset
        imageEdgeInsets = UIEdgeInsets(top: topImageInset, left: leftImageInset, bottom: bottomImageInset, right: rightImageInset)
        
        let topTitleInset = self.frame.height - (self.titleLabel?.frame.height ?? 0) - 6
        let bottomTitleInset = CGFloat(6)
        let leftTitleInset = -(self.imageView?.frame.width ?? 0)
        let rightTitleInset = CGFloat(0)
        titleEdgeInsets = UIEdgeInsets(top: topTitleInset, left: leftTitleInset, bottom: bottomTitleInset, right: rightTitleInset)
    }
}
