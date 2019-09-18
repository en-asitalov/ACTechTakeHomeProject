//
//  PaymentDetailsBuilder.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 9/14/19.
//  Copyright © 2019 Alexei Sitalov. All rights reserved.
//

import UIKit
import Swinject

protocol PaymentDetailsBuilderLogic {
    func buildPaymentDetailsViewController(with paymentId: String) -> PaymentDetailsViewController
}

class PaymentDetailsBuilder: PaymentDetailsBuilderLogic {
    
    let container = Container(parent: ServicesContainer.default)
    
    func buildPaymentDetailsViewController(with paymentId: String) -> PaymentDetailsViewController {
        container.register(PaymentDetailsPresenterLogic.self) { c in
            PaymentDetailsPresenter(view: c.resolve(PaymentDetailsViewController.self)!,
                                    interactor: c.resolve(PaymentDetailsInteractorLogic.self)!)
        }
        
        container.register(PaymentDetailsInteractorLogic.self) { c in
            PaymentDetailsInteractor(contentGetterService: c.resolve(ContentGetterService.self)!,
                                     paymentId: paymentId)
        }
        
        container.register(PaymentDetailsViewController.self) { _ in
            PaymentDetailsViewController(
                nibName: String(describing: PaymentDetailsViewController.self),
                bundle: Bundle.main)
            }.initCompleted { r, h in
                let presenter = r.resolve(PaymentDetailsPresenterLogic.self)
                h.presenter = presenter
        }
        
        return container.resolve(PaymentDetailsViewController.self)!
    }
    
    deinit {
        container.removeAll()
    }
}
