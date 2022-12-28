//
//  RowLayout.swift
//  VkNewsFeed
//
//  Created by Maksim Grischenko on 28.12.2022.
//

import Foundation
import UIKit

protocol RowLayoutDelegate: AnyObject {
    func collectionView(_ collectionView: UICollectionView, photoAtIndexPath indexPath: IndexPath) -> CGSize
}

class Rowlayout: UICollectionViewLayout {
    
    weak var delegate: RowLayoutDelegate!
    
    private var numberOfRows = 1
    private var cellPadding: CGFloat = 8
    
    private var cache = [UICollectionViewLayoutAttributes]()
    
    private var contentWidth: CGFloat = 0
//    константа
    private var contentHeight: CGFloat {
        guard let collectionView = collectionView else { return 0 }
        
        let insets = collectionView.contentInset
        return collectionView.bounds.height - (insets.left + insets.right)
    }
    override var collectionViewContentSize: CGSize {
        CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func prepare() {
        guard cache.isEmpty == true, let collectionView = collectionView else { return }
        
        var photos = [CGSize]()
        
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            let photoSize = delegate.collectionView(collectionView, photoAtIndexPath: indexPath)
            photos.append(photoSize)
        }
        let superViewWidth = collectionView.frame.width
        guard let rowHeight = rowHeightCounter(superViewWidth: superViewWidth, photosArray: photos) else { return }
        
    }
    private func rowHeightCounter(superViewWidth: CGFloat, photosArray: [CGSize]) -> CGFloat? {
        var rowHeight: CGFloat
        
        let photoWithMinRatio = photosArray.min { first, second in
            (first.height / first.width) < (second.height / second.width)
        }
        
        guard let myPhotoWithMinRatio = photoWithMinRatio else { return nil }
        
        let difference = superViewWidth / myPhotoWithMinRatio.width
        rowHeight = myPhotoWithMinRatio.height * difference
        return rowHeight
    }
}
