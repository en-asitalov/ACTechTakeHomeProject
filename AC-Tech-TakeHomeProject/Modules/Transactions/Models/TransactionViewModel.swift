//
//  TransactionViewModel.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 9/15/19.
//  Copyright © 2019 Alexei Sitalov. All rights reserved.
//

import Foundation

struct TransactionViewModel {
    let transactionId: String
    let date: String
    let hour: String
    let amount: String
    let currency: String
    let cardTypeLogo: String
    let merchantName: String
    let state: String
    
    init(transaction: Dictionary<String, Any>) {
        self.transactionId = "\(transaction["id"]!)"
        self.date = "\(transaction["date"]!)"
        self.hour = "\(transaction["hour"]!)"
        self.amount = "\(transaction["amount"]!)"
        self.currency = "\(transaction["currency"]!)"
        self.cardTypeLogo = "\(transaction["cardType"]!)"
        self.merchantName = "\(transaction["merchantName"]!)"
        self.state = "\(transaction["state"]!)"
    }
}
