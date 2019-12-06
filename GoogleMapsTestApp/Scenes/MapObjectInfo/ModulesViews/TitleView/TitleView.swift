//
//  TitleView.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 06.12.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class TitleView: UIView, TitleShowable {
    
    @IBOutlet weak internal var titleLabel: UILabel?
    @IBOutlet weak internal var descriptionLabel: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromNib(nibName: "TitleView")
//        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadFromNib(nibName: "TitleView")
//        configureView()
    }
    
//    private func loadFromNib() -> UIView {
//        guard let view = UINib(nibName: "TitleView", bundle: Bundle(for: type(of: self))).instantiate(withOwner: self, options: nil).first as? UIView else { return UIView() }
//        return view
//    }
//
//    private func configureView() {
//        let view = loadFromNib()
//        view.frame = bounds
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        addSubview(view)
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
