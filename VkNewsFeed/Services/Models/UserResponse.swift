//
//  UserResponse.swift
//  VkNewsFeed
//
//  Created by Maksim Grischenko on 03.01.2023.
//

import Foundation

struct UserResponseWrapped: Decodable {
    let response: [UserResponse]
}

struct UserResponse: Decodable {
    let photo100: String?
}
