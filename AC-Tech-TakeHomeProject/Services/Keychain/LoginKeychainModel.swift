//
//  LoginKeychainModel.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 9/14/19.
//  Copyright © 2019 Alexei Sitalov. All rights reserved.
//

import Foundation

public struct LoginKeychainModel {
    static let usernameKey = "AC-Tech_username"
    static let passwordKey = "AC-Tech_password"
    
    var username: String?
    var password: String?
}
