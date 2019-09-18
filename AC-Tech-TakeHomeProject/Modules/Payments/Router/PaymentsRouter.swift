//
//  PaymentsRouter.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 15/09/2019.
//  Copyright © 2019 Company. All rights reserved.
//

import Foundation

protocol PaymentsRouterLogic {
    func showPaymentDetails(with paymentId: String)
}

class PaymentsRouter: PaymentsRouterLogic {
    
    weak var viewController: PaymentsViewController!
    
    func showPaymentDetails(with paymentId: String) {
        let paymentDetailsController = PaymentDetailsBuilder().buildPaymentDetailsViewController(with: paymentId)
        viewController?.navigationController?.pushViewController(paymentDetailsController, animated: true)
    }
}
