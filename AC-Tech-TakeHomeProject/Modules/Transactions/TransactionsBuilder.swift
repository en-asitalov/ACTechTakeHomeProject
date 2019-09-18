//
//  TransactionsBuilder.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 15/09/2019.
//  Copyright © 2019 Company. All rights reserved.
//

import UIKit
import Swinject

protocol TransactionsBuilderLogic {
    func buildTransactionsViewController() -> TransactionsViewController
}

class TransactionsBuilder: TransactionsBuilderLogic {
    
    let container = Container(parent: ServicesContainer.default)
    
    func buildTransactionsViewController() -> TransactionsViewController {
        
        container.register(TransactionsInteractorLogic.self) { c in
            TransactionsInteractor(contentGetterService: c.resolve(ContentGetterService.self)!)
        }
        
        container.register(TransactionsViewController.self) { _ in
            
            TransactionsViewController(nibName: String(describing:TransactionsViewController.self), bundle: Bundle.main)
            
            }.initCompleted { r, h in
                
                h.presenter = r.resolve(TransactionsPresenterLogic.self)
        }
        
        container.register(TransactionsRouterLogic.self) { c in
            let router = TransactionsRouter()
            router.viewController = c.resolve(TransactionsViewController.self)!
            return router
        }
        
        container.register(TransactionsPresenterLogic.self) { c in
            TransactionsPresenter(view: c.resolve(TransactionsViewController.self)!,
                                  interactor: c.resolve(TransactionsInteractorLogic.self)!,
                                  router: c.resolve(TransactionsRouterLogic.self)!)
        }
        
        return container.resolve(TransactionsViewController.self)!
    }
    
    deinit {
        container.removeAll()
    }
}
