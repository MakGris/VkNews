//
//  NetworkService.swift
//  VkNewsFeed
//
//  Created by Maksim Grischenko on 22.11.2022.
//

import Foundation

class NetworkService {
    private let authService: AuthService
    
    init(authService: AuthService = SceneDelegate.shared().authService) {
        self.authService = authService
    }
    func getFeed() {
        
        var components = URLComponents()
        guard let token = authService.token else { return }
        let parameters = ["filters": "post, photo"]
        var allParameters = parameters
        allParameters["access_token"] = token
        allParameters["v"] = API.version
        
        components.scheme = API.scheme
        components.host = API.host
        components.path = API.newsfeed
        components.queryItems = allParameters.map{ URLQueryItem(name: $0, value: $1) }
        
       let url = components.url!
        print(url)
    }
}
