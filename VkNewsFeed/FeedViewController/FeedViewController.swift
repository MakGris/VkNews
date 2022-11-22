//
//  FeedViewController.swift
//  VkNewsFeed
//
//  Created by Maksim Grischenko on 21.11.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    private let networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        networkService.getFeed()
    }
}
