//
//  TransactionDetailsPresenter.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 9/14/19.
//  Copyright © 2019 Alexei Sitalov. All rights reserved.
//

import Foundation

protocol TransactionDetailsPresenterLogic {
    func getDetail(at indexPath: IndexPath, in section: TransactionDetailsSection) -> DataSourceDetailsModel
    func getNumberOfRows(for section: TransactionDetailsSection) -> Int
}

final class TransactionDetailsPresenter {
    
    weak var view: TransactionDetailsViewControllerInput!
    var interactor: TransactionDetailsInteractorLogic!
    private var transactionDetailsModel: TransactionDetailsViewModel?
    
    init(view: TransactionDetailsViewControllerInput,
         interactor: TransactionDetailsInteractorLogic) {
        self.view = view
        self.interactor = interactor
        setupDataSource()
    }
    
    // MARK: - Private methods
    private func setupDataSource() {
        guard let model = interactor.getTransactionDetailsViewModel() else { return }
        view.configure(with: model)
    }
}

extension TransactionDetailsPresenter: TransactionDetailsPresenterLogic {
    func getNumberOfRows(for section: TransactionDetailsSection) -> Int {
        switch section {
        case .general:
            return interactor.getGeneralDataSource().count
        case .paymentDetail:
            return interactor.getPaymentDetailsDataSource().count
        case .merchantReference:
            return interactor.getMerchantReferenceDataSource().count
        case .miscellaneous:
            return interactor.getMischellaneousDataSource().count
        }
    }
    
    func getDetail(at indexPath: IndexPath, in section: TransactionDetailsSection) -> DataSourceDetailsModel {
        switch section {
        case .general:
            return interactor.getGeneralDataSource()[indexPath.row]
        case .paymentDetail:
            return interactor.getPaymentDetailsDataSource()[indexPath.row]
        case .merchantReference:
            return interactor.getMerchantReferenceDataSource()[indexPath.row]
        case .miscellaneous:
            return interactor.getMischellaneousDataSource()[indexPath.row]
        }
    }
}
