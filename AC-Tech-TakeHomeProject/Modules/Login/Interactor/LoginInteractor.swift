//
//  LoginInteractor.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 14/09/2019.
//  Copyright © 2019 Company. All rights reserved.
//

import Foundation

protocol LoginInteractorLogic {
    func saveCredentials(username: String, password: String)
    func isUserValid(for username: String) -> Bool
}

class LoginInteractor: LoginInteractorLogic {
    
    private let keychainService: KeychainService
    
    init(keychainService: KeychainService) {
        self.keychainService = keychainService
    }
    
    func isUserValid(for username: String) -> Bool {
        if let _ = Bundle.main.path(forResource: username, ofType: "json") {
            return true
        }
        return false
    }
    
    func saveCredentials(username: String, password: String) {
        let keychainModel = LoginKeychainModel(username: username, password: password)
        keychainService.persistLogin(keychainModel)
    }
}
