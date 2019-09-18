//
//  TransactionsInteractor.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 15/09/2019.
//  Copyright © 2019 Company. All rights reserved.
//

import Foundation

protocol TransactionsInteractorLogic {
    func getTransactionsCount() -> Int
    func getTransaction(at index: Int) -> TransactionViewModel
}

class TransactionsInteractor: TransactionsInteractorLogic {
    
    private let contentGetterService: ContentGetterService
    
    init(contentGetterService: ContentGetterService) {
        self.contentGetterService = contentGetterService
    }
    
    func getTransactionsCount() -> Int {
        return contentGetterService.getListOfContents(for: .transactions).count
    }
    
    func getTransaction(at index: Int) -> TransactionViewModel {
        let transaction = contentGetterService.getContent(for: .transactions, at: index)
        return TransactionViewModel(transaction: transaction)
    }
}
