//
//  TransactionsRouter.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 15/09/2019.
//  Copyright © 2019 Company. All rights reserved.
//

import Foundation

protocol TransactionsRouterLogic {
    func showTransactionDetails(with transactionId: String)
}

class TransactionsRouter: TransactionsRouterLogic {
    
    weak var viewController: TransactionsViewController!
    
    func showTransactionDetails(with transactionId: String) {
        let transactionDetailsController = TransactionDetailsBuilder()
            .buildTransactionDetailsViewController(with: transactionId)
        viewController?.navigationController?
            .pushViewController(transactionDetailsController, animated: true)
    }
}
