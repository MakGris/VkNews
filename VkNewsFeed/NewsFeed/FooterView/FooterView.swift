//
//  FooterView.swift
//  VkNewsFeed
//
//  Created by Maksim Grischenko on 05.01.2023.
//

import Foundation
import UIKit

class FooterView: UIView {
    
    
    private let myLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor(red: 161/255, green: 165/255, blue: 169/255, alpha: 1)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var loader: UIActivityIndicatorView = {
       let loader = UIActivityIndicatorView()
        loader.translatesAutoresizingMaskIntoConstraints = false
        loader.hidesWhenStopped = true
        return loader
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(myLabel)
        addSubview(loader)
        
        myLabel.anchor(
            top: topAnchor,
            leading: leadingAnchor,
            bottom: nil,
            trailing: trailingAnchor,
            padding: UIEdgeInsets(top: 8, left: 20, bottom: 777, right: 20)
        )
        loader.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loader.topAnchor.constraint(equalTo: myLabel.bottomAnchor, constant: 8).isActive = true
    }
    
    func showLoadder() {
        loader.startAnimating()
    }
    
    func setTitle(title: String?) {
        loader.stopAnimating()
        myLabel.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
