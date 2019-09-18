//
//  MoreMenuBuilder.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 15/09/2019.
//  Copyright © 2019 Company. All rights reserved.
//

import UIKit
import Swinject

protocol MoreMenuBuilderLogic {
    func buildMoreMenuViewController() -> MoreMenuViewController
}

class MoreMenuBuilder: MoreMenuBuilderLogic {
    
    let container = Container(parent: ServicesContainer.default)
    
    func buildMoreMenuViewController() -> MoreMenuViewController {
        
        container.register(MoreMenuInteractorLogic.self) { c in
            MoreMenuInteractor(keychainService: c.resolve(KeychainService.self)!,
                               userDefaultsManager: c.resolve(UserDefaultsManager.self)!)
        }
        
        container.register(MoreMenuViewController.self) { _ in
            
            MoreMenuViewController(nibName: String(describing:MoreMenuViewController.self), bundle: Bundle.main)
            
            }.initCompleted { r, h in
                
                h.presenter = r.resolve(MoreMenuPresenterLogic.self)
        }
        
        container.register(MoreMenuRouterLogic.self) { c in
            let router = MoreMenuRouter()
            router.viewController = c.resolve(MoreMenuViewController.self)!
            return router
        }
        
        container.register(MoreMenuPresenterLogic.self) { c in
            MoreMenuPresenter(view: c.resolve(MoreMenuViewController.self)!,
                              interactor: c.resolve(MoreMenuInteractorLogic.self)!,
                              router: c.resolve(MoreMenuRouterLogic.self)!)
        }
        
        return container.resolve(MoreMenuViewController.self)!
    }
    
    deinit {
        container.removeAll()
    }
}
