//
//  AppServiceRegister.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 9/14/19.
//  Copyright © 2019 Alexei Sitalov. All rights reserved.
//

import Swinject

class AppServicesRegister {
    func registerKeychainService(in container: Container) {
        container.register(KeychainService.self) { _ in
            DefaultKeychainService()
        }
    }
    
    func registerContentGetterService(in container: Container) {
        container.register(ContentGetterService.self) { c in
            let keychainService = c.resolve(KeychainService.self)!
            return DefaultContentGetterService(keychainService: keychainService)
        }
    }
    
    func registerUserDefaultsManager(in container: Container) {
        container.register(UserDefaultsManager.self) { _ in
            return DefaultUserDefaultsManager()
        }
    }
}
