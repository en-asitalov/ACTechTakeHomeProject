//
//  LoginRouter.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 14/09/2019.
//  Copyright © 2019 Company. All rights reserved.
//

import UIKit

protocol LoginRouterLogic {
    func redirectToTransactions()
}

class LoginRouter: LoginRouterLogic {
    
    weak var viewController: LoginViewController!
    
    func redirectToTransactions() {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate,
              let window = delegate.window else { return }
        window.rootViewController = AppTabBarBuilder().build()
    }
}
