//
//  NewsFeedCodeCell.swift
//  VkNewsFeed
//
//  Created by Maksim Grischenko on 19.12.2022.
//

import Foundation
import UIKit

class NewsFeedCodeCell: UITableViewCell {
    
    static let reuseId = "NewsFeedCodeCell"
    
    let cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(cardView)
        backgroundColor = .gray
        
        //        cardView constraints
        //        cardView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        //        cardView.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        //        cardView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
        //        cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        //        cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        //        cardView.fillSuperview(padding: UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12))
        
        //        cardView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        //        cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        //        cardView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        //        cardView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        cardView.anchor(
            top: topAnchor,
            leading: leadingAnchor,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 8, left: 8, bottom: 777, right: 777),
            size: CGSize(width: 40, height: 40)
        )
        
        //        cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        //        cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        //        cardView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        //        cardView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        //        cardView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        //        cardView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        //        cardView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        //        cardView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/2).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
