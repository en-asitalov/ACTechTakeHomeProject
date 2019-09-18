//
//  PaymentsInteractor.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 15/09/2019.
//  Copyright © 2019 Company. All rights reserved.
//

import Foundation

protocol PaymentsInteractorLogic {
    func getPaymentsCount() -> Int
    func getPayment(at index: Int) -> PaymentViewModel
}

class PaymentsInteractor: PaymentsInteractorLogic {
    
    private let contentGetterService: ContentGetterService
    
    init(contentGetterService: ContentGetterService) {
        self.contentGetterService = contentGetterService
    }
    
    func getPaymentsCount() -> Int {
        return contentGetterService.getListOfContents(for: .payments).count
    }
    
    func getPayment(at index: Int) -> PaymentViewModel {
        let payment = contentGetterService.getContent(for: .payments, at: index)
        return PaymentViewModel(payment: payment)
    }
    
}
