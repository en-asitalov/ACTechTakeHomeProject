//
//  TransactionDetailsBuilder.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 9/14/19.
//  Copyright © 2019 Alexei Sitalov. All rights reserved.
//


import UIKit
import Swinject

protocol TransactionDetailsBuilderLogic {
    func buildTransactionDetailsViewController(with transactionId: String) -> TransactionDetailsViewController
}

final class TransactionDetailsBuilder: TransactionDetailsBuilderLogic {
    
    let container = Container(parent: ServicesContainer.default)

    func buildTransactionDetailsViewController(with transactionId: String) -> TransactionDetailsViewController {
        
        container.register(TransactionDetailsPresenterLogic.self) { c in
            TransactionDetailsPresenter(view: c.resolve(TransactionDetailsViewController.self)!,
                                        interactor: c.resolve(TransactionDetailsInteractorLogic.self)!)
        }
        
        container.register(TransactionDetailsInteractorLogic.self) { c in
            return TransactionDetailsInteractor(contentGetterService: c.resolve(ContentGetterService.self)!,
                                                transactionId: transactionId)
        }
        
        container.register(TransactionDetailsViewController.self) { _ in
            TransactionDetailsViewController(nibName:
                String(describing: TransactionDetailsViewController.self),
                                             bundle: Bundle.main)
            
            }.initCompleted { r, h in
                let presenter = r.resolve(TransactionDetailsPresenterLogic.self)
                h.presenter = presenter
        }

        return container.resolve(TransactionDetailsViewController.self)!
    }
    
    // MARK: - Deinit
    deinit {
        container.removeAll()
    }
}
