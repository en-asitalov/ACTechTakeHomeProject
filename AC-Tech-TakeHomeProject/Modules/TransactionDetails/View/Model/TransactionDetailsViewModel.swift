//
//  TransactionDetailsViewModel.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 9/14/19.
//  Copyright © 2019 Alexei Sitalov. All rights reserved.
//

import Foundation

struct TransactionDetailsViewModel {
    
    let traceNumber: String
    let merchantName: String
    let totalAmount: String
    let currency: String
    let transactionDate: String
    let transactionTime: String
    let transactionState: String
    let terminalId: String
    let cardTypeLogo: String
    let eOdTransaction: String
    let paymentNumber: String
    let feesNumber: String
    let payoutDate: String
    let priceModel: String
    let statementDate: String
    let paymentGrossAmount: String
    let paymentNetAmount: String
    let totalFee: String
    let vatAmount: String
    let exchangeRate: String
    let merchantCity: String
    let branchNumber: String
    let contractPartnerNumber: String
    let salesChannel: String
    let externalReceiptNumber: String
    let transactionReferenceNumber: String
    let arn: String
    
    init(transactionDetails: Dictionary<String, Any>) {
        self.traceNumber = "\(transactionDetails["trace"]!)"
        self.merchantName = "\(transactionDetails["merchantName"]!)"
        self.totalAmount = "\(transactionDetails["amount"]!)"
        self.currency = "\(transactionDetails["currency"]!)"
        self.transactionDate = "\(transactionDetails["date"]!)"
        self.transactionTime = "\(transactionDetails["time"]!)"
        self.transactionState = "\(transactionDetails["state"]!)"
        self.terminalId = "\(transactionDetails["terminalId"]!)"
        self.cardTypeLogo = "\(transactionDetails["cardType"]!)"
        self.eOdTransaction = "\(transactionDetails["eODTransaction"]!)"
        self.paymentNumber = "No data"
        self.feesNumber = "\(transactionDetails["paymentNoFees"]!)"
        self.payoutDate = "\(transactionDetails["payoutDate"]!)"
        self.priceModel = "\(transactionDetails["priceModel"]!)"
        self.statementDate = "\(transactionDetails["statementDate"]!)"
        self.paymentGrossAmount = "\(transactionDetails["grossPaymentAmount"]!)"
        self.paymentNetAmount = "\(transactionDetails["netPaymentAmount"]!)"
        self.totalFee = "\(transactionDetails["totalFee"]!)"
        self.vatAmount = "\(transactionDetails["vatAmount"]!)"
        self.exchangeRate = "\(transactionDetails["exchangeRate"]!)"
        self.merchantCity = "\(transactionDetails["merchantCity"]!)"
        self.branchNumber = "\(transactionDetails["branchNumber"]!)"
        self.contractPartnerNumber = "\(transactionDetails["contractPartnerNumber"]!)"
        self.salesChannel = "\(transactionDetails["salesChannel"]!)"
        self.externalReceiptNumber = "\(transactionDetails["externalReceiptNumber"]!)"
        self.transactionReferenceNumber = "\(transactionDetails["transactionReferenceNumber"]!)"
        self.arn = "\(transactionDetails["arn"]!)"
    }
}
