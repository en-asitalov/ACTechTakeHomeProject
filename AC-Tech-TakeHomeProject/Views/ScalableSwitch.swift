//
//  ScalableSwitch.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 9/15/19.
//  Copyright © 2019 Alexei Sitalov. All rights reserved.
//

import UIKit

@IBDesignable class ScalableSwitch: UISwitch {
    
    @IBInspectable var scale: CGFloat = 1 {
        didSet {
            setup()
        }
    }
    
    @IBInspectable var offTint: UIColor? {
        didSet {
            tintColor = offTint
            backgroundColor = offTint
        }
    }
    
    // from storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // from code
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    private func setup() {
        transform = CGAffineTransform(scaleX: scale, y: scale)
        layer.cornerRadius = frame.height / scale / 2
    }
    
    override func prepareForInterfaceBuilder() {
        setup()
        super.prepareForInterfaceBuilder()
    }
}
