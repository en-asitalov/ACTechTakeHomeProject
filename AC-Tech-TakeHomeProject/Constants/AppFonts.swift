//
//  AppFonts.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 9/15/19.
//  Copyright © 2019 Alexei Sitalov. All rights reserved.
//

import UIKit

enum FontStyle: String {
    case black = "UniNeue-Black"
    case blackItalic = "UniNeue-Black-Italic"
    case bold = "UniNeueBold"
    case boldItalic = "UniNeueBold-Italic"
    case book = "UniNeueBook"
    case bookItalic = "UniNeueBook-Italic"
    case heavy = "UniNeueHeavy"
    case heavyItalic = "UniNeueHeavy-Italic"
    case light = "UniNeueLight"
    case lightItalic = "UniNeueLight-Italic"
    case regular = "UniNeueRegular"
    case regularItalic = "UniNeueRegular-Italic"
    case thin = "UniNeueThin"
    case thinItalic = "UniNeueThin-Italic"
}

extension UIFont {
    static func setFont(_ name: FontStyle, size: CGFloat) -> UIFont {
        return UIFont(name: name.rawValue, size: size)
            ?? UIFont.systemFont(ofSize: systemFontSize)
    }
}
