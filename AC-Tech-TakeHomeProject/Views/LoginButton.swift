//
//  LoginButton.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 9/14/19.
//  Copyright © 2019 Alexei Sitalov. All rights reserved.
//

import UIKit

private struct Constants {
    static let titleLabelSize: CGFloat = 22
}

class LoginButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    
    private func setupButton() {
        backgroundColor     = Colors.defaultThemeColor
        titleLabel?.font    = UIFont(name: "AvenirNextCondensed-DemiBold", size: Constants.titleLabelSize)
        layer.cornerRadius  = frame.size.height/2
        setTitleColor(.white, for: .normal)
    }
}
