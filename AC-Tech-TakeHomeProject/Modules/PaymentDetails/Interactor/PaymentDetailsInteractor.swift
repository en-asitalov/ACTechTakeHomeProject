//
//  PaymentDetailsInteractor.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 9/14/19.
//  Copyright © 2019 Alexei Sitalov. All rights reserved.
//

import Foundation

protocol PaymentDetailsInteractorLogic {
    func getGeneralDataSource() -> [DataSourceDetailsModel]
    func getMischellaneousDataSource() -> [DataSourceDetailsModel]
    func getPaymentDetailsViewModel() -> PaymentDetailsViewModel?
}

class PaymentDetailsInteractor: PaymentDetailsInteractorLogic {
    
    private let contentGetterService: ContentGetterService
    private let paymentId: String
    private var paymentDetailsViewModel: PaymentDetailsViewModel?
    
    init(contentGetterService: ContentGetterService,
         paymentId: String) {
        self.contentGetterService = contentGetterService
        self.paymentId = paymentId
    }
    
    func getPaymentDetailsViewModel() -> PaymentDetailsViewModel? {
        let paymentDetailsList = contentGetterService.getListOfContents(for: .paymentDetails)
        let paymentDetailsForId = paymentDetailsList.filter { $0["id"] as? String == paymentId }.first!
        paymentDetailsViewModel = PaymentDetailsViewModel(paymentDetails: paymentDetailsForId)
        return paymentDetailsViewModel
    }
    
    func getGeneralDataSource() -> [DataSourceDetailsModel] {
        guard let paymentDetails = paymentDetailsViewModel else { return [] }
        return PaymentDetailsModelBuilder.getGeneralSourceArray(from: paymentDetails)
    }
    
    func getMischellaneousDataSource() -> [DataSourceDetailsModel] {
        guard let paymentDetails = paymentDetailsViewModel else { return [] }
        return PaymentDetailsModelBuilder.getMischellaneousArray(from: paymentDetails)
    }
}

