//
//  TransactionsPresenter.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 15/09/2019.
//  Copyright © 2019 Company. All rights reserved.
//

import Foundation

protocol TransactionsPresenterLogic {
    func getNumberOfRows() -> Int
    func getTransaction(at index: Int) -> TransactionViewModel
    func didSelectItem(with transactionId: String)
}

class TransactionsPresenter {
    
    weak var view: TransactionsViewControllerInput!
    var interactor: TransactionsInteractorLogic!
    var router: TransactionsRouterLogic!
    
    init(view: TransactionsViewControllerInput,
         interactor: TransactionsInteractorLogic,
         router: TransactionsRouterLogic) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension TransactionsPresenter: TransactionsPresenterLogic {
    func getNumberOfRows() -> Int {
        return interactor.getTransactionsCount()
    }
    
    func getTransaction(at index: Int) -> TransactionViewModel {
        return interactor.getTransaction(at: index)
    }
    
    func didSelectItem(with transactionId: String) {
        router.showTransactionDetails(with: transactionId)
    }
}
