//
//  PhotoCell.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 06.12.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell, Reusable {

    @IBOutlet weak private var photo: UIImageView!
    
    func setImage(_ imageName: String) {
        photo.image = UIImage(named: imageName)
    }
}
