//
//  MoreMenuRouter.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 15/09/2019.
//  Copyright © 2019 Company. All rights reserved.
//

import UIKit

protocol MoreMenuRouterLogic {
    func redirectToLogin()
}

class MoreMenuRouter: MoreMenuRouterLogic {
    
    weak var viewController: MoreMenuViewController!
    
    func redirectToLogin() {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate,
            let window = delegate.window else { return }
        window.rootViewController = LoginBuilder().buildLoginViewController()
    }
}
