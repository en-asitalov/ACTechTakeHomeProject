//
//  TransactionDetailsHeaderView.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 9/14/19.
//  Copyright © 2019 Alexei Sitalov. All rights reserved.
//

import UIKit

class TransactionDetailsHeaderView: UIView, NibLoadableView {
    // MARK: - Outlets
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var traceNumberLabel: UILabel!
    @IBOutlet weak var merchantNameLabel: UILabel!
    @IBOutlet weak var traceNumberTitleLabel: UILabel!
    @IBOutlet weak var merchantNameTitleLabel: UILabel!
    @IBOutlet weak var transactionStatusLabel: UILabel!
    
    @IBOutlet weak var cardLogoImageView: UIImageView!
    
    var reverseAction: ActionClosure = nil
    
    private var tapGesture: UITapGestureRecognizer?

    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    private func setupViews() {
        traceNumberTitleLabel.text = "Trace number"
        merchantNameTitleLabel.text = "Merchant"
    }

    func configure(with model: TransactionDetailsViewModel) {
        traceNumberLabel.text = model.traceNumber
        merchantNameLabel.text = model.merchantName
        amountLabel.text = model.totalAmount
        dateLabel.text = "\(model.transactionDate) \(model.transactionTime)"
        currencyLabel.text = model.currency
        setupStateLabel(for: model.transactionState)
        cardLogoImageView.image = UIImage(named: "\(model.cardTypeLogo)_DETAILS")!
    }

    // MARK: - Private methods
    private func setupStateLabel(for transactionState: String) {
        let isSubmitted = transactionState == "SETTLED"
        transactionStatusLabel.text = transactionState
        let stateLabelColor: UIColor = isSubmitted ? .blue : .green
        transactionStatusLabel.backgroundColor = stateLabelColor
    }
}
