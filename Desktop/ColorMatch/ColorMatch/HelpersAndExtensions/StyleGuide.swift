//
//  StyleGuide.swift
//  ColorMatch
//
//  Created by Trevor Bursach on 9/3/21.
//

import UIKit

extension UIView {
    func addCornerRadius(radius: CGFloat = 8) {
        self.layer.cornerRadius = radius
    }
    
    func addLabelCornerRadius(radius: CGFloat = 16) {
        self.layer.cornerRadius = radius
    }
}
