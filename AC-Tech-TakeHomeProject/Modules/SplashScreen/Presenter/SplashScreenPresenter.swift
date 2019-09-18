//
//  SplashScreenPresenter.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 14/09/2019.
//  Copyright © 2019 Company. All rights reserved.
//

import Foundation

protocol SplashScreenPresenterLogic {
    func checkUserCredentials()
}

class SplashScreenPresenter {
    
    weak var view: SplashScreenViewControllerInput!
    var interactor: SplashScreenInteractorLogic!
    var router: SplashScreenRouterLogic!
    
    init(view: SplashScreenViewControllerInput, interactor: SplashScreenInteractorLogic, router: SplashScreenRouterLogic) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}

extension SplashScreenPresenter: SplashScreenPresenterLogic {
    func checkUserCredentials() {
        if interactor.isUserLoggedIn() {
            router.navigateToTransactions()
        } else {
            router.navigateToLogin()
        }
    }
}
