//
//  PaymentDetailsModelBuilder.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 9/14/19.
//  Copyright © 2019 Alexei Sitalov. All rights reserved.
//

import Foundation

struct PaymentDetailsModelBuilder {
    static func getGeneralSourceArray(from
        model: PaymentDetailsViewModel) -> [DataSourceDetailsModel] {
        let grossAmountValue = model.grossAmount + " " + model.currency
        let totalFeeValue = model.feeAmount + " " + model.currency
        let vatAmount = model.vatAmount + "%"
        
        return [
            DataSourceDetailsModel(descriptionLabelText: "Gross amount",
                                   valueLabelText: grossAmountValue),
            DataSourceDetailsModel(descriptionLabelText: "Total fee",
                                   valueLabelText: totalFeeValue),
            DataSourceDetailsModel(descriptionLabelText: "VAT",
                                   valueLabelText: vatAmount),
            DataSourceDetailsModel(descriptionLabelText: "IC",
                                   valueLabelText: model.interchangeFeeInPaymentCurrency),
            DataSourceDetailsModel(descriptionLabelText: "Business Partner Id",
                                   valueLabelText: model.businessPartnerId)
        ]
    }
    
  
    
    static func getMischellaneousArray(from
        model: PaymentDetailsViewModel) -> [DataSourceDetailsModel] {
        return [
            DataSourceDetailsModel(descriptionLabelText: "Branch number",
                                   valueLabelText: model.branchId),
            DataSourceDetailsModel(descriptionLabelText: "Merchant ID of payee",
                                   valueLabelText: model.merchantId),
            DataSourceDetailsModel(descriptionLabelText: "IBAN",
                                   valueLabelText: model.iban),
            DataSourceDetailsModel(descriptionLabelText: "Bank account number",
                                   valueLabelText: model.paymentAccount),
            DataSourceDetailsModel(descriptionLabelText: "Bank ID",
                                   valueLabelText: model.paymentBankKey),
            DataSourceDetailsModel(descriptionLabelText: "SEPA Mandat reference number",
                                   valueLabelText: model.sepaMandate)
        ]
    }
}

