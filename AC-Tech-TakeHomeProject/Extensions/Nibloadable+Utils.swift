//
//  Nibloadable+Utils.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 9/15/19.
//  Copyright © 2019 Alexei Sitalov. All rights reserved.
//

import UIKit

protocol ReusableView: class {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}

protocol NibLoadableView: class {
    static var defaultNibName: String { get }
}

extension NibLoadableView where Self: UIView {
    static var defaultNibName: String {
        return String("\(self)".split { $0 == "." }.last!)
    }
    
    static func instantiate() -> Self {
        let views = Bundle.main.loadNibNamed(
            defaultNibName, owner: self, options: nil)!
        return views.first as! Self
    }
}
