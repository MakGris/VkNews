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
    
    static var numberOfRows = 2
    fileprivate var cellPadding: CGFloat = 8
    
    fileprivate var cache = [UICollectionViewLayoutAttributes]()
    
    fileprivate var contentWidth: CGFloat = 0
//    константа
    fileprivate var contentHeight: CGFloat {
        guard let collectionView = collectionView else { return 0 }
        
        let insets = collectionView.contentInset
        return collectionView.bounds.height - (insets.left + insets.right)
    }
    override var collectionViewContentSize: CGSize {
        CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func prepare() {
        contentWidth = 0
        cache = []
        guard cache.isEmpty == true, let collectionView = collectionView else { return }
        
        var photos = [CGSize]()
        
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            let photoSize = delegate.collectionView(collectionView, photoAtIndexPath: indexPath)
            photos.append(photoSize)
        }
        let superViewWidth = collectionView.frame.width
        
        guard var rowHeight = Rowlayout.rowHeightCounter(superViewWidth: superViewWidth, photosArray: photos) else { return }
        
        rowHeight = rowHeight / CGFloat(Rowlayout.numberOfRows)
        var yOffset = [CGFloat]()
        
        let photosRatios = photos.map { $0.height / $0.width }
        for row in 0 ..< Rowlayout.numberOfRows {
            yOffset.append(CGFloat(row) * rowHeight)
        }
        
        var xOffset = [CGFloat](repeating: 0, count: Rowlayout.numberOfRows)
        
        var row = 0
        
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            
            let ratio = photosRatios[indexPath.row]
            let width = rowHeight / ratio
            let frame = CGRect(x: xOffset[row], y: yOffset[row], width: width, height: rowHeight)
            let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
            
            let attribute = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attribute.frame = insetFrame
            cache.append(attribute)
            
            contentWidth = max(contentWidth, frame.maxX)
            xOffset[row] = xOffset[row] + width
            row = row < (Rowlayout.numberOfRows - 1) ? (row + 1) : 0
        }
                
        
    }
    static func rowHeightCounter(superViewWidth: CGFloat, photosArray: [CGSize]) -> CGFloat? {
        var rowHeight: CGFloat
        
        let photoWithMinRatio = photosArray.min { first, second in
            (first.height / first.width) < (second.height / second.width)
        }
        
        guard let myPhotoWithMinRatio = photoWithMinRatio else { return nil }
        
        let difference = superViewWidth / myPhotoWithMinRatio.width
        rowHeight = myPhotoWithMinRatio.height * difference
        rowHeight = rowHeight * CGFloat(Rowlayout.numberOfRows)
        return rowHeight
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAttributes = [UICollectionViewLayoutAttributes]()
        
        for attribute in cache {
            if attribute.frame.intersects(rect) {
                visibleLayoutAttributes.append(attribute)
            }
        }
        return visibleLayoutAttributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.row]
    }
}
