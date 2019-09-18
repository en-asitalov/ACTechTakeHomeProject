//
//  LoginTextField.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 9/14/19.
//  Copyright © 2019 Alexei Sitalov. All rights reserved.
//

import UIKit

private struct Constants {
    static let cornerRadius: CGFloat = 25.0
    static let indentViewSide = 20
    static let placeholderFontSize: CGFloat = 18
}

class LoginTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpField()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init( coder: aDecoder )
        setUpField()
    }
    
    
    private func setUpField() {
        textColor             = .darkGray
        font                  = UIFont(name: "AvenirNextCondensed-DemiBold", size: Constants.placeholderFontSize)
        backgroundColor       = UIColor(white: 1.0, alpha: 0.5)
        autocorrectionType    = .no
        layer.cornerRadius    = Constants.cornerRadius
        clipsToBounds         = true
        
        let placeholder       = self.placeholder != nil ? self.placeholder! : ""
        let placeholderFont   = UIFont(name: "AvenirNextCondensed-DemiBold", size: Constants.placeholderFontSize)!
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes:
            [NSAttributedString.Key.foregroundColor: UIColor.lightGray,
             NSAttributedString.Key.font: placeholderFont])
        
        let indentView        = UIView(frame: CGRect(x: 0,
                                                     y: 0,
                                                     width: Constants.indentViewSide,
                                                     height: Constants.indentViewSide))
        leftView              = indentView
        leftViewMode          = .always
    }
}
