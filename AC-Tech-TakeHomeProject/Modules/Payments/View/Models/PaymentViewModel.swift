//
//  PaymentViewModel.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 9/15/19.
//  Copyright © 2019 Alexei Sitalov. All rights reserved.
//

struct PaymentViewModel {
    let paymentId: String
    let date: String
    let hour: String
    let amount: String
    let currency: String
    let numberOfTransactions: String
    let businessPartnerId: String
    
    init(payment: Dictionary<String, Any>) {
        self.paymentId = "\(payment["id"]!)"
        self.date = "\(payment["date"]!)"
        self.hour = "\(payment["hour"]!)"
        self.amount = "\(payment["amount"]!)"
        self.currency = "\(payment["currency"]!)"
        self.numberOfTransactions = "\(payment["transactionCount"]!)"
        self.businessPartnerId = "\(payment["businessPartnerId"]!)"
    }
}
