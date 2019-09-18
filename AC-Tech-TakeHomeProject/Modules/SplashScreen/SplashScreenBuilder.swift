//
//  SplashScreenBuilder.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 14/09/2019.
//  Copyright © 2019 Company. All rights reserved.
//

import UIKit
import Swinject

protocol SplashScreenBuilderLogic {
    func buildSplashScreenViewController() -> SplashScreenViewController
}

class SplashScreenBuilder: SplashScreenBuilderLogic {
    
    let container = Container(parent: ServicesContainer.default)
    
    func buildSplashScreenViewController() -> SplashScreenViewController {
        
        container.register(SplashScreenInteractorLogic.self) { c in
            SplashScreenInteractor(keychainService: c.resolve(KeychainService.self)!) //Add service
        }
        
        container.register(SplashScreenViewController.self) { _ in
            
            SplashScreenViewController(nibName: String(describing:SplashScreenViewController.self), bundle: Bundle.main)
            
            }.initCompleted { r, h in
                
                h.presenter = r.resolve(SplashScreenPresenterLogic.self)
        }
        
        container.register(SplashScreenRouterLogic.self) { c in
            let router = SplashScreenRouter()
            router.viewController = c.resolve(SplashScreenViewController.self)!
            return router
        }
        
        container.register(SplashScreenPresenterLogic.self) { c in
            SplashScreenPresenter(view: c.resolve(SplashScreenViewController.self)!,
                                  interactor: c.resolve(SplashScreenInteractorLogic.self)!,
                                  router: c.resolve(SplashScreenRouterLogic.self)!)
        }
        
        return container.resolve(SplashScreenViewController.self)!
    }
    
    deinit {
        container.removeAll()
    }
}
