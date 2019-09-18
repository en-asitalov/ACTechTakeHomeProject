//
//  TransactionTableViewCell.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 14/09/2019.
//  Copyright © 2019 Company. All rights reserved.
//

import UIKit

final class TransactionTableViewCell: UITableViewCell, NibLoadableView, ReusableView {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var ouNameLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var cardLogoImageView: UIImageView!
    @IBOutlet weak var dotImageView: UIImageView!
    
    func config(with viewModel: TransactionViewModel?) {
        guard let viewModel = viewModel else { return }
        cardLogoImageView.image =  UIImage(named: viewModel.cardTypeLogo)
        dateLabel.text = "\(viewModel.date) \(viewModel.hour)"
        amountLabel.text = "\(viewModel.amount) \(viewModel.currency)"
        ouNameLabel.text = viewModel.merchantName
        setupStateLabel(for: viewModel.state)
    }
    
    private func setupStateLabel(for transactionState: String) {
        stateLabel.text = transactionState
        let stateLabelColor: UIColor = transactionState == "PAID" ? .green : .blue
        stateLabel.textColor = stateLabelColor
        dotImageView.backgroundColor = stateLabelColor
    }
}
