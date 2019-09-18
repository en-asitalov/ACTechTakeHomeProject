//
//  PaymentCell.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 9/15/19.
//  Copyright © 2019 Alexei Sitalov. All rights reserved.
//

import UIKit

class PaymentCell: UITableViewCell, NibLoadableView, ReusableView {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var paymentIdTitleLabel: UILabel!
    @IBOutlet weak var paymentIdValueLabel: UILabel!
    @IBOutlet weak var numberOfTranactionsTitleLabel: UILabel!
    @IBOutlet weak var numberOfTranactionsValueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        paymentIdTitleLabel.text = "Payment ID"
        numberOfTranactionsTitleLabel.text = "No. of Transactions"
    }
    
    func config(with viewModel: PaymentViewModel?) {
        guard let viewModel = viewModel else { return }
        dateLabel.text = viewModel.date + " " + viewModel.hour
        amountLabel.text = viewModel.amount + " " + viewModel.currency
        paymentIdValueLabel.text = viewModel.paymentId
        numberOfTranactionsValueLabel.text = viewModel.numberOfTransactions
    }
}
