//
//  GradientView.swift
//  VkNewsFeed
//
//  Created by Maksim Grischenko on 05.01.2023.
//

import Foundation
import UIKit

class GradientView: UIView {
    
    @IBInspectable private var startColor: UIColor? {
        didSet {
            setupGradientColors()
        }
    }
    @IBInspectable private var endColor: UIColor? {
        didSet {
            setupGradientColors()
        }
    }
    private let gradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = .blue
        setupGradient()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
        
    }
    
    private func setupGradient() {
        self.layer.addSublayer(gradientLayer)
        setupGradientColors()
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
    }
    private func setupGradientColors() {
        if let startColor = startColor, let endColor = endColor {
            gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        }
    }
}
