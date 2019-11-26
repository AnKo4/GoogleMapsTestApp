//
//  ObjectTitleView.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 25.11.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class ObjectTitleView: UIView {

    @IBOutlet weak var objectTitleLabel: UILabel!
    @IBOutlet weak var objectDescriptionLabel: UILabel!
    @IBOutlet weak var objectRating: Rating!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }
    
    private func loadFromNib() -> UIView {
        guard let view = UINib(nibName: "ObjectTitleView", bundle: Bundle(for: type(of: self))).instantiate(withOwner: self, options: nil).first as? UIView else { return UIView() }
        return view
    }
    
    private func configureView() {
        let view = loadFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
    
}
