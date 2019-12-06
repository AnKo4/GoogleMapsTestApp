//
//  PhotosView.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 06.12.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class PhotosView: UIView, PhotosShowable, NibLoadable, NibConfigurable {

    @IBOutlet weak private var collectionView: UICollectionView?
    @IBOutlet weak private var photosProviderLabel: UILabel?
    
    internal var data: [String] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        configureCollectionView()
    }
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
        configureCollectionView()
    }
        
//    private func loadFromNib() -> UIView {
//        guard let view = UINib(nibName: "PhotosView", bundle: Bundle(for: type(of: self))).instantiate(withOwner: self, options: nil).first as? UIView else { return UIView() }
//        return view
//    }
//
//    private func configureView() {
//        let view = loadFromNib()
//        view.frame = bounds
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        addSubview(view)
//    }
    
    private func configureCollectionView() {
        collectionView?.register(cellType: PhotoCell.self)
    }
    
    func showPhotos(using data: [String], on photosProvider: String?) {
        guard data.count != 0 else {
            isHidden = true
            return
        }
        self.data = data
        collectionView?.reloadData()
        photosProviderLabel?.text = "Photos on \(photosProvider ?? "unknown provider")"
    }
}

extension PhotosView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: PhotoCell.self)
        cell.setImage(data[indexPath.item])
        return cell
    }
}

extension PhotosView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        switch indexPath.item {
        case 0:
            return CGSize(width: width * 0.6, height: height)
        default:
            return CGSize(width: width * 0.4, height: height * 0.5)
        }
    }
}
