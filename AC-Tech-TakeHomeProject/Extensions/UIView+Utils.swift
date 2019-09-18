//
//  UIView+Utils.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 9/15/19.
//  Copyright © 2019 Alexei Sitalov. All rights reserved.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
    
    @IBInspectable var round: Bool {
        get { return bounds.width == bounds.height && cornerRadius == bounds.height/2 }
        set { cornerRadius = newValue ? bounds.height > bounds.width ? bounds.width/2
            : bounds.height/2 : layer.cornerRadius }
    }
}
