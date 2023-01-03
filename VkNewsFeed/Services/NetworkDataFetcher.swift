//
//  NetworkDataFetcher.swift
//  VkNewsFeed
//
//  Created by Maksim Grischenko on 28.11.2022.
//

import Foundation
protocol DataFetcher {
    func getFeed(response: @escaping (FeedResponse?) -> Void)
    func getUser(response: @escaping (UserResponse?) -> Void)
}

struct NetworkDataFetcher: DataFetcher {
    
    private let authService: AuthService
    let networking: Networking
    
    init(networking: Networking, authService: AuthService = SceneDelegate.shared().authService) {
        self.networking = networking
        self.authService = authService
        
    }
    
    func getUser(response: @escaping (UserResponse?) -> Void) {
        
        guard let userId = authService.userId else { return }
        let parameters = ["user_ids": userId, "fields": "photo_100"]
        networking.request(path: API.user, parameters: parameters) { data, error in
            
            if let error = error {
                print("error received requestind data: \(error.localizedDescription)")
                response(nil)
            }
            let decoded = self.decodeJSON(type: UserResponseWrapped.self, from: data)
            response(decoded?.response.first)
        }
    }
    
    func getFeed(response: @escaping (FeedResponse?) -> Void) {
        let parameters = ["filters": "post, photo"]
        networking.request(path: API.newsfeed, parameters: parameters) { data, error in
            if let error = error {
                print("error received requestind data: \(error.localizedDescription)")
                response(nil)
            }
            
            let decoded = decodeJSON(type: FeedResponseWrapped.self, from: data)
            response(decoded?.response)
        }
    }
    
    private func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let data = from, let response = try? decoder.decode(type.self, from: data) else { return nil }
        return response
    }
    
}
