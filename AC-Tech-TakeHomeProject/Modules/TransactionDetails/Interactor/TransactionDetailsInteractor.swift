//
//  TransactionDetailsInteractor.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 9/14/19.
//  Copyright © 2019 Alexei Sitalov. All rights reserved.
//

import Foundation

protocol TransactionDetailsInteractorLogic {
    func getTransactionDetailsViewModel() -> TransactionDetailsViewModel?
    func getGeneralDataSource() -> [DataSourceDetailsModel]
    func getPaymentDetailsDataSource() -> [DataSourceDetailsModel]
    func getMerchantReferenceDataSource() -> [DataSourceDetailsModel]
    func getMischellaneousDataSource() -> [DataSourceDetailsModel]
}

final class TransactionDetailsInteractor: TransactionDetailsInteractorLogic {
    
    private let contentGetterService: ContentGetterService
    private let transactionId: String
    private var transactionDetailsViewModel: TransactionDetailsViewModel?
    
    init(contentGetterService: ContentGetterService,
         transactionId: String) {
        self.contentGetterService = contentGetterService
        self.transactionId = transactionId
    }
    
    func getTransactionDetailsViewModel() -> TransactionDetailsViewModel? {
        let transactionDetailsList = contentGetterService.getListOfContents(for: .transactionDetails)
        let transactionDetailsForId = transactionDetailsList.filter { $0["id"] as? String == transactionId }.first!
        transactionDetailsViewModel = TransactionDetailsViewModel(transactionDetails: transactionDetailsForId)
        return transactionDetailsViewModel
    }
    
    func getGeneralDataSource() -> [DataSourceDetailsModel] {
        guard let transactionDetails = transactionDetailsViewModel else { return [] }
        return TransactionDetailsModelBuilder.getGeneralSourceArray(from: transactionDetails)
    }
    
    func getPaymentDetailsDataSource() -> [DataSourceDetailsModel] {
        guard let transactionDetails = transactionDetailsViewModel else { return [] }
        return TransactionDetailsModelBuilder.getPaymentDetailsSourceArray(from: transactionDetails)
    }
    
    func getMerchantReferenceDataSource() -> [DataSourceDetailsModel] {
        guard let transactionDetails = transactionDetailsViewModel else { return [] }
        return TransactionDetailsModelBuilder.getMetchantReferenceSourceArray(from: transactionDetails)
    }
    
    func getMischellaneousDataSource() -> [DataSourceDetailsModel] {
        guard let transactionDetails = transactionDetailsViewModel else { return [] }
        return TransactionDetailsModelBuilder.getMischellaneousArray(from: transactionDetails)
    }
}

