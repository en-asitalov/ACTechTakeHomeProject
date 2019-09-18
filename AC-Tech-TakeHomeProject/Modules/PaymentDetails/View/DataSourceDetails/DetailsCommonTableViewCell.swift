//
//  DetailsCommonTableViewCell.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 9/14/19.
//  Copyright © 2019 Alexei Sitalov. All rights reserved.
//

import UIKit

final class DetailsCommonTableViewCell: UITableViewCell, NibLoadableView, ReusableView {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!

    func config(with viewModel: DataSourceDetailsModel) {
        descriptionLabel.text = viewModel.descriptionLabelText
        valueLabel.text = viewModel.valueLabelText
    }
}
