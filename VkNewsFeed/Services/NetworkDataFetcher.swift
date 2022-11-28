//
//  NetworkDataFetcher.swift
//  VkNewsFeed
//
//  Created by Maksim Grischenko on 28.11.2022.
//

import Foundation
protocol DataFetcher {
    func getFeed(response: @escaping (FeedResponse?) -> Void)
}

struct NetworkDataFetcher: DataFetcher {
    
    let networking: Networking
    init(networking: Networking) {
        self.networking = networking
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
