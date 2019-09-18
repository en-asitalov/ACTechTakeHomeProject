//
//  PaymentsPresenter.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 15/09/2019.
//  Copyright © 2019 Company. All rights reserved.
//

import Foundation

protocol PaymentsPresenterLogic {
    func getNumberOfRows() -> Int
    func didSelectItem(with paymentId: String)
    func getPayment(at index: Int) -> PaymentViewModel
}

class PaymentsPresenter {
    
    weak var view: PaymentsViewControllerInput!
    var interactor: PaymentsInteractorLogic!
    var router: PaymentsRouterLogic!
    
    init(view: PaymentsViewControllerInput, interactor: PaymentsInteractorLogic, router: PaymentsRouterLogic) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension PaymentsPresenter: PaymentsPresenterLogic {
    func getNumberOfRows() -> Int {
        return interactor.getPaymentsCount()
    }
    
    func getPayment(at index: Int) -> PaymentViewModel {
        return interactor.getPayment(at: index)
    }
    
    func didSelectItem(with paymentId: String) {
        router.showPaymentDetails(with: paymentId)
    }
}
