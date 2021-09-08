//
//  CustomTextFields.swift
//  ColorMatch
//
//  Created by Trevor Bursach on 9/3/21.
//

import UIKit

class CustomTextFields: UITextField {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpViews()
        
    }
    
    func setUpViews() {
        self.addCornerRadius()
    }
    
} // END OF CLASS
