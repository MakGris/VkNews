//
//  NewsFeedInteractor.swift
//  VkNewsFeed
//
//  Created by Maksim Grischenko on 29.11.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol NewsFeedBusinessLogic {
  func makeRequest(request: NewsFeed.Model.Request.RequestType)
}

class NewsFeedInteractor: NewsFeedBusinessLogic {

  var presenter: NewsFeedPresentationLogic?
  var service: NewsFeedService?
 
  func makeRequest(request: NewsFeed.Model.Request.RequestType) {
    if service == nil {
      service = NewsFeedService()
    }
      switch request {
          
      case .getNewsFeed:
          service?.getFeed(completion: { [weak self] revealedPostIds, feed in
              self?.presenter?.presentData(response: .presentNewsFeed(feed: feed, revealedPostids: revealedPostIds))
          })
          
      case .getUser:
          service?.getUser(completion: { [weak self] user in
              self?.presenter?.presentData(response: .presentUserInfo(user: user))
          })
      case .revealPostIds(postId: let postId):
          service?.revealPostIds(forPostId: postId, completion: { [weak self] revealedPostIds, feed in
              self?.presenter?.presentData(response: .presentNewsFeed(feed: feed, revealedPostids: revealedPostIds))
          })
      case .getNextBatch:
          print("123")
          service?.getNextBatch(completion: { [weak self] revealedPostIds, feed in
              self?.presenter?.presentData(response: .presentNewsFeed(feed: feed, revealedPostids: revealedPostIds))
          })
      }
  }
    
}
