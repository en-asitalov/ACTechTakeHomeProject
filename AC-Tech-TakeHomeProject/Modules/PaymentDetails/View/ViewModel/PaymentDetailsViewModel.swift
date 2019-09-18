//
//  PaymentDetailsViewModel.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 9/14/19.
//  Copyright © 2019 Alexei Sitalov. All rights reserved.
//

import Foundation

struct PaymentDetailsViewModel {
    let paymentId: String
    let date: String
    let hour: String
    let currency: String
    let amount: String
    
    let branchId: String
    let vatAmount: String
    let interchangeFeeInPaymentCurrency: String
    let businessPartnerId: String
    let merchantId: String
    let paymentAccount: String
    let transactionCount: String
    let feeAmount: String
    let grossAmount: String
    let iban: String
    let sepaMandate: String
    let paymentBankKey: String
    
    init(paymentDetails: Dictionary<String, Any>) {
        self.paymentId = "\(paymentDetails["id"]!)"
        self.date = "\(paymentDetails["date"]!)"
        self.hour = "\(paymentDetails["hour"]!)"
        self.currency = "\(paymentDetails["currency"]!)"
        self.amount = "\(paymentDetails["amount"]!)"
        
        self.branchId = "\(paymentDetails["branchId"]!)"
        self.vatAmount = "\(paymentDetails["vatAmount"]!)"
        self.interchangeFeeInPaymentCurrency = "\(paymentDetails["interchangeFeeInPaymentCurrency"]!)"
        self.businessPartnerId = "\(paymentDetails["businessPartnerId"]!)"
        self.merchantId = "\(paymentDetails["merchantId"]!)"
        self.paymentAccount = "\(paymentDetails["paymentAccount"]!)"
        self.transactionCount = "\(paymentDetails["transactionCount"]!)"
        self.feeAmount = "\(paymentDetails["feeAmount"]!)"
        self.grossAmount = "\(paymentDetails["grossAmount"]!)"
        self.iban = "\(paymentDetails["iBAN"]!)"
        self.sepaMandate = "\(paymentDetails["sepaMandate"]!)"
        self.paymentBankKey = "\(paymentDetails["paymentBankKey"]!)"
        
    }
}
