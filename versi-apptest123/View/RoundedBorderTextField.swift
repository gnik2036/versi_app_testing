//
//  RoundedBorderTextField.swift
//  versi-apptest123
//
//  Created by mohammed hassan on 6/14/20.
//  Copyright © 2020 mohammed hassan. All rights reserved.
//

import UIKit

class RoundedBorderTextField: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        let placeHolder = NSAttributedString(string: self.placeholder! , attributes: [NSAttributedString.Key.foregroundColor:#colorLiteral(red: 0.1294117647, green: 0.5764705882, blue: 1, alpha: 1)])
        attributedPlaceholder = placeHolder 
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        layer.cornerRadius = frame.height / 2
        layer.borderColor = #colorLiteral(red: 0.1294117647, green: 0.5764705882, blue: 1, alpha: 1)
        layer.borderWidth = 3
        
    }

}
