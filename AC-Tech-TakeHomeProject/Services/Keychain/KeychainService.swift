//
//  KeychainService.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 9/14/19.
//  Copyright © 2019 Alexei Sitalov. All rights reserved.
//

import Foundation
import KeychainAccess

protocol KeychainService {
    func persistLogin(_ loginData: LoginKeychainModel)
    func fetchLoginData() -> LoginKeychainModel
    func removeLoginData()
}

final class DefaultKeychainService: KeychainService {
    private let keychain = Keychain(service: Bundle.main.bundleIdentifier!)
    
    func persistLogin(_ loginData: LoginKeychainModel) {
        keychain[LoginKeychainModel.usernameKey] = loginData.username
        keychain[LoginKeychainModel.passwordKey] = loginData.password
    }
    
    func fetchLoginData() -> LoginKeychainModel {
        return LoginKeychainModel(username: keychain[LoginKeychainModel.usernameKey],
                                  password: keychain[LoginKeychainModel.passwordKey])
    }
    
    func removeLoginData() {
        keychain[LoginKeychainModel.usernameKey] = nil
        keychain[LoginKeychainModel.passwordKey] = nil
    }
}
