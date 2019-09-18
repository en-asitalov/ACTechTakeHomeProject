//
//  TransactionDetailsModelBuilder.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 9/14/19.
//  Copyright © 2019 Alexei Sitalov. All rights reserved.
//

import Foundation

struct TransactionDetailsModelBuilder {
    static func getGeneralSourceArray(from
        model: TransactionDetailsViewModel) -> [DataSourceDetailsModel] {
        return [
            DataSourceDetailsModel(descriptionLabelText: "Terminal ID",
                                   valueLabelText: model.terminalId),
            DataSourceDetailsModel(descriptionLabelText: "EOD Transaction",
                                   valueLabelText: model.eOdTransaction)
        ]
    }
    
    static func getPaymentDetailsSourceArray(from
        model: TransactionDetailsViewModel) -> [DataSourceDetailsModel] {
        let currency = model.currency
        
        let grossAmountValue = model.paymentGrossAmount + " " + currency
        let totalFeeValue = model.totalFee + " " + currency
        let vatAmountValue = model.vatAmount + " " + model.currency
        let netAmountValue = model.paymentNetAmount + " " + currency
        
        return [
            DataSourceDetailsModel(descriptionLabelText: "Payment number:",
                                   valueLabelText: model.paymentNumber),
            DataSourceDetailsModel(descriptionLabelText: "Payment number (fees)",
                                   valueLabelText: model.feesNumber),
            DataSourceDetailsModel(descriptionLabelText: "Payment date:",
                                   valueLabelText: model.payoutDate),
            DataSourceDetailsModel(descriptionLabelText: "Price model",
                                   valueLabelText: model.priceModel),
            DataSourceDetailsModel(descriptionLabelText: "Payment currency:",
                                   valueLabelText: currency),
            DataSourceDetailsModel(descriptionLabelText: "Gross payment amount",
                                   valueLabelText: grossAmountValue),
            DataSourceDetailsModel(descriptionLabelText: "Total fee",
                                   valueLabelText: totalFeeValue),
            DataSourceDetailsModel(descriptionLabelText: "VAT amount",
                                   valueLabelText: vatAmountValue),
            DataSourceDetailsModel(descriptionLabelText: "NET payment amount",
                                   valueLabelText: netAmountValue),
            DataSourceDetailsModel(descriptionLabelText: "Conversion rate",
                                   valueLabelText: model.exchangeRate),
            DataSourceDetailsModel(descriptionLabelText: "Statement date",
                                   valueLabelText: model.statementDate)
        ]
    }
    
    static func getMetchantReferenceSourceArray(from
        model: TransactionDetailsViewModel) -> [DataSourceDetailsModel] {
        return [
            DataSourceDetailsModel(descriptionLabelText: "Organisation unit",
                                   valueLabelText: model.merchantName),
            DataSourceDetailsModel(descriptionLabelText: "City",
                                   valueLabelText: model.merchantCity),
            DataSourceDetailsModel(descriptionLabelText: "Branch number",
                                   valueLabelText: model.branchNumber),
            DataSourceDetailsModel(descriptionLabelText: "Contact number",
                                   valueLabelText: model.contractPartnerNumber)
        ]
    }
    
    static func getMischellaneousArray(from
        model: TransactionDetailsViewModel) -> [DataSourceDetailsModel] {
        return [
            DataSourceDetailsModel(descriptionLabelText: "Sales channel",
                                   valueLabelText: model.salesChannel),
            DataSourceDetailsModel(descriptionLabelText: "Card number",
                                   valueLabelText: "No data"),
            DataSourceDetailsModel(descriptionLabelText: "External receipt number",
                                   valueLabelText: model.externalReceiptNumber),
            DataSourceDetailsModel(descriptionLabelText: "Transaction reference number",
                                   valueLabelText: model.transactionReferenceNumber),
            DataSourceDetailsModel(descriptionLabelText: "ARN",
                                   valueLabelText: model.arn)
        ]
    }
}
