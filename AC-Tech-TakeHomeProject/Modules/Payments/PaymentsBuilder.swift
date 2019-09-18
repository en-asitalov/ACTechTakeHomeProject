//
//  PaymentsBuilder.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 15/09/2019.
//  Copyright © 2019 Company. All rights reserved.
//

import UIKit
import Swinject

protocol PaymentsBuilderLogic {
    func buildPaymentsViewController() -> PaymentsViewController
}

class PaymentsBuilder: PaymentsBuilderLogic {
    
    let container = Container(parent: ServicesContainer.default)
    
    func buildPaymentsViewController() -> PaymentsViewController {
        
        container.register(PaymentsInteractorLogic.self) { c in
            PaymentsInteractor(contentGetterService: c.resolve(ContentGetterService.self)!)
        }
        
        container.register(PaymentsViewController.self) { _ in
            
            PaymentsViewController(nibName: String(describing:PaymentsViewController.self), bundle: Bundle.main)
            
            }.initCompleted { r, h in
                
                h.presenter = r.resolve(PaymentsPresenterLogic.self)
        }
        
        container.register(PaymentsRouterLogic.self) { c in
            let router = PaymentsRouter()
            router.viewController = c.resolve(PaymentsViewController.self)!
            return router
        }
        
        container.register(PaymentsPresenterLogic.self) { c in
            PaymentsPresenter(view: c.resolve(PaymentsViewController.self)!,
                              interactor: c.resolve(PaymentsInteractorLogic.self)!,
                              router: c.resolve(PaymentsRouterLogic.self)!)
        }
        
        return container.resolve(PaymentsViewController.self)!
    }
    
    deinit {
        container.removeAll()
    }
}
