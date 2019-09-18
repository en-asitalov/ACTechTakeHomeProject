//
//  SplashScreenInteractor.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 14/09/2019.
//  Copyright © 2019 Company. All rights reserved.
//

import Foundation

protocol SplashScreenInteractorLogic {
    func isUserLoggedIn() -> Bool
}

class SplashScreenInteractor: SplashScreenInteractorLogic {
    
    private let keychainService: KeychainService
    
    init(keychainService: KeychainService) {
        self.keychainService = keychainService
    }
    
    func isUserLoggedIn() -> Bool {
        let credentials = keychainService.fetchLoginData()
        return credentials.username != nil && credentials.password != nil
    }
}
