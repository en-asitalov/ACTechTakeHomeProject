//
//  LoginBuilder.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 14/09/2019.
//  Copyright © 2019 Company. All rights reserved.
//

import UIKit
import Swinject

protocol LoginBuilderLogic {
    func buildLoginViewController() -> LoginViewController
}

class LoginBuilder: LoginBuilderLogic {
    
    let container = Container(parent: ServicesContainer.default)
    
    func buildLoginViewController() -> LoginViewController {
        
        container.register(LoginInteractorLogic.self) { c in
            LoginInteractor(keychainService: c.resolve(KeychainService.self)!)
        }
        
        container.register(LoginViewController.self) { _ in
            
            let viewController = LoginViewController(nibName: String(describing: LoginViewController.self),
                                                     bundle: Bundle.main)
            viewController.title = "Login"
        
            return viewController
            
            }.initCompleted { r, h in
                
                h.presenter = r.resolve(LoginPresenterLogic.self)
        }
        
        container.register(LoginRouterLogic.self) { c in
            let router = LoginRouter()
            router.viewController = c.resolve(LoginViewController.self)!
            return router
        }
        
        container.register(LoginPresenterLogic.self) { c in
            LoginPresenter(view: c.resolve(LoginViewController.self)!,
                           interactor: c.resolve(LoginInteractorLogic.self)!,
                           router: c.resolve(LoginRouterLogic.self)!)
        }
        
        return container.resolve(LoginViewController.self)!
    }
    
    deinit {
        container.removeAll()
    }
}
