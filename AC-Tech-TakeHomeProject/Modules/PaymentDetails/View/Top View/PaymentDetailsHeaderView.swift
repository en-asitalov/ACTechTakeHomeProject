//
//  PaymentDetailsHeaderView.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 9/14/19.
//  Copyright © 2019 Alexei Sitalov. All rights reserved.
//

import UIKit

class PaymentDetailsHeaderView: UIView, NibLoadableView {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var paymentNumberTitleLabel: UILabel!
    @IBOutlet weak var paymentNumberLabel: UILabel!
    @IBOutlet weak var transactionsTitleLabel: UILabel!
    @IBOutlet weak var transactionsLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    func configure(with model: PaymentDetailsViewModel) {
        dateLabel.text = model.date + " " + model.hour
        amountLabel.text = model.amount
        currencyLabel.text = model.currency
        paymentNumberLabel.text = model.paymentId
        transactionsLabel.text = model.transactionCount
    }

    // MARK: - Private methods
    private func setupViews() {
        paymentNumberTitleLabel.text = "Payment no"
        transactionsTitleLabel.text = "Transactions"
    }
}
