//
//  LoginPresenter.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 14/09/2019.
//  Copyright © 2019 Company. All rights reserved.
//

import Foundation

protocol LoginPresenterLogic {
    func validateCredentials(for username: String?, password: String?)
}

class LoginPresenter {
    
    weak var view: LoginViewControllerInput!
    var interactor: LoginInteractorLogic!
    var router: LoginRouterLogic!
    
    init(view: LoginViewControllerInput, interactor: LoginInteractorLogic, router: LoginRouterLogic) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    private func saveCredentials(username: String, password: String) {
        interactor.saveCredentials(username: username, password: password)
    }
}

extension LoginPresenter: LoginPresenterLogic {
    func validateCredentials(for username: String?, password: String?) {
        view.showLoading()
        
        guard let username = username, !username.isEmpty else {
            view.hideLoading()
            view.showAlert("Error", message: "Username field is empty")
            return
        }
        
        guard let password = password, !password.isEmpty else {
            view.hideLoading()
            view.showAlert("Error", message: "Password field is empty")
            return
        }
        
        guard interactor.isUserValid(for: username) else {
            view.hideLoading()
            view.showAlert("Error", message: "Invalid username or password")
            return
        }
        
        interactor.saveCredentials(username: username, password: password)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
            self.router.redirectToTransactions()
        })
        
    }
}
