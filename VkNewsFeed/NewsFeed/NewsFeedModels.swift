//
//  NewsFeedModels.swift
//  VkNewsFeed
//
//  Created by Maksim Grischenko on 29.11.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum NewsFeed {
   
  enum Model {
    struct Request {
      enum RequestType {
        case getNewsFeed
          case getUser
          case revealPostIds(postId: Int)
          case getNextBatch
      }
    }
    struct Response {
      enum ResponseType {
          case presentNewsFeed(feed: FeedResponse, revealedPostids: [Int])
          case presentUserInfo(user: UserResponse?)
          case presentFooterLoader
      }
    }
    struct ViewModel {
      enum ViewModelData {
          case displayNewsFeed(feedViewModel: FeedViewModel)
          case displayUser(UserViewModel: UserViewModel)
          case displayFooterLoader
      }
    }
  }
}

struct UserViewModel: TitleViewViewModel {
    var photoUrlString: String?
}

struct FeedViewModel {
    struct Cell: FeedCellViewModel {
        
        var postId: Int
        
        var iconUrlString: String
        var name: String
        var date: String
        var text: String?
        var likes: String?
        var comments: String?
        var shares: String?
        var views: String?
        var photoAttachments: [FeedCellPhotoAttachmentViewModel]
        var sizes: FeedCellSizes
    }
    struct FeedCellPhotoAttachment: FeedCellPhotoAttachmentViewModel {
        var photoUrlString: String?
        var width: Int
        var height: Int
    }
    let cells: [Cell]
    let footerTitle: String?
}
