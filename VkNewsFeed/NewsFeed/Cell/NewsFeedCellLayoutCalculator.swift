//
//  NewsFeedCellLayoutCalculator.swift
//  VkNewsFeed
//
//  Created by Maksim Grischenko on 09.12.2022.
//

import Foundation
import UIKit
 
protocol FeedCellLayoutCalculatorProtocol {
    func sizes(postText: String?, photoAttachment: FeedCellPhotoAttachmentViewModel?) -> FeedCellSizes
}

struct Sizes: FeedCellSizes {
    
    var postLabelFrame: CGRect
    var attachmentFrame: CGRect
}

final class FeedCellLayoutCalculator: FeedCellLayoutCalculatorProtocol {
    
    private let screenWidth: CGFloat
    
    init(screenWidth: CGFloat = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height)) {
        self.screenWidth = screenWidth
    }
   
    func sizes(postText: String?, photoAttachment: FeedCellPhotoAttachmentViewModel?) -> FeedCellSizes {
        return Sizes(postLabelFrame: CGRect.zero, attachmentFrame: CGRect.zero)
    }
}
