//
//  PaymentDetailsPresenter.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 9/14/19.
//  Copyright © 2019 Alexei Sitalov. All rights reserved.
//

import UIKit

protocol PaymentDetailsPresenterLogic {
    func getNumberOfRows(for section: PaymentDetailsSection) -> Int
    func getDetail(at indexPath: IndexPath, in section: PaymentDetailsSection) -> DataSourceDetailsModel
}

class PaymentDetailsPresenter {

    weak var view: PaymentDetailsViewControllerInput!
    var interactor: PaymentDetailsInteractorLogic!
    
    private var generalDataSource: [DataSourceDetailsModel] = []
    private var mischellaneousDataSource: [DataSourceDetailsModel] = []
    
    init(view: PaymentDetailsViewControllerInput,
         interactor: PaymentDetailsInteractorLogic) {
        self.view = view
        self.interactor = interactor
        setupDataSource()
    }
    
    private func setupDataSource() {
        guard let model = interactor.getPaymentDetailsViewModel() else { return }
        view.configure(with: model)
    }
}

// MARK: - PaymentDetailsPresenterLogic
extension PaymentDetailsPresenter: PaymentDetailsPresenterLogic {
    func getNumberOfRows(for section: PaymentDetailsSection) -> Int {
        switch section {
        case .general:
            return interactor.getGeneralDataSource().count
        case .miscellaneous:
            return interactor.getMischellaneousDataSource().count
        }
    }
    
    func getDetail(at indexPath: IndexPath, in section: PaymentDetailsSection) -> DataSourceDetailsModel {
        switch section {
        case .general:
            return interactor.getGeneralDataSource()[indexPath.row]
        case .miscellaneous:
            return interactor.getMischellaneousDataSource()[indexPath.row]
        }
    }
}
