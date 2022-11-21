//
//  ViewController.swift
//  VkNewsFeed
//
//  Created by Maksim Grischenko on 16.11.2022.
//

import UIKit

class AuthViewController: UIViewController {
    private var authService: AuthService!
    override func viewDidLoad() {
        super.viewDidLoad()
        authService = SceneDelegate.shared().authService
        view.backgroundColor = .red
    }


    @IBAction func signInTouch(_ sender: UIButton) {
        authService.wakeUpSession()
        
    }
}

