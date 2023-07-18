//
//  UIViewExtension.swift
//  Movie Trending
//
//  Created by Amr El-Fiqi on 18/07/2023.
//

import Foundation
import UIKit

extension UIView {
    
    func round(_ radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    func addBorder(color: UIColor, width: CGFloat) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
}
