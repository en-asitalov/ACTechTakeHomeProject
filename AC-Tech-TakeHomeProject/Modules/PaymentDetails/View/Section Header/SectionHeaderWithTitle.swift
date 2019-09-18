//
//  SectionHeaderWithTitle.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 9/14/19.
//  Copyright © 2019 Alexei Sitalov. All rights reserved.
//

import UIKit

private struct Constants {
    static let detailsFontSize: CGFloat = 18
}

final class SectionHeaderWithTitle: UIView, NibLoadableView {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func config(with title: String) {
        titleLabel.textColor = Colors.defaultThemeColor
        titleLabel.text = title
        titleLabel.font = .setFont(.bold, size: Constants.detailsFontSize)
        backgroundColor = .white
    }
}
