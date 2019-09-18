//
//  SplashScreenRouter.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 14/09/2019.
//  Copyright © 2019 Company. All rights reserved.
//

import UIKit

protocol SplashScreenRouterLogic {
    func navigateToTransactions()
    func navigateToLogin()
}

class SplashScreenRouter: SplashScreenRouterLogic {
    
    weak var viewController: SplashScreenViewController!
    
    func navigateToTransactions() {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate,
            let window = delegate.window else { return }
        window.rootViewController = AppTabBarBuilder().build()
    }
    
    func navigateToLogin() {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate,
            let window = delegate.window else { return }
        window.rootViewController = LoginBuilder().buildLoginViewController()
    }
}
