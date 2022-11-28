//
//  FeedResponse.swift
//  VkNewsFeed
//
//  Created by Maksim Grischenko on 28.11.2022.
//

import Foundation

struct FeedResponseWrapped: Decodable {
    let response: FeedResponse
}

struct FeedResponse: Decodable {
    var items: [FeedItem]
}

struct FeedItem: Decodable {
    let sourceId: Int
    let postId: Int
    let text: String?
    let date: Double
    let comments: CountableItem?
    let likes: CountableItem?
    let reposts: CountableItem?
    let views: CountableItem?
    
}

struct CountableItem: Decodable {
    let count: Int
}
