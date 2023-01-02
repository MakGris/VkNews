//
//  GalleryCollectionViewCell.swift
//  VkNewsFeed
//
//  Created by Maksim Grischenko on 27.12.2022.
//

import Foundation
import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "GalleryCollectionViewCell"
    let myImageView: WebImageVIew = {
        let imageView = WebImageVIew()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = UIColor(red: 227/255, green: 229/255, blue: 232/255, alpha: 1)
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(myImageView)
        

//        my imageViewConstraints
        myImageView.fillSuperview()

    }
    
    override func prepareForReuse() {
        myImageView.image = nil
    }
    
    func set(imageUrl: String?) {
        myImageView.set(imageUrl: imageUrl)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        myImageView.layer.masksToBounds = true
        myImageView.layer.cornerRadius = 10
        self.layer.shadowRadius = 3
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 2.5, height: 4)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
