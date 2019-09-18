//
//  ServiceContainer.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 9/14/19.
//  Copyright © 2019 Alexei Sitalov. All rights reserved.
//

import Foundation
import Swinject

final class ServicesContainer {
    static var `default`: Container = {
        
        let container = Container()
        registerAppServices(in: container)
        
        return container
    }()
    
    // MARK: - Register App Services
    private static func registerAppServices(in container: Container) {
        let appServicesBuilder = AppServicesRegister()
        appServicesBuilder.registerKeychainService(in: container)
        appServicesBuilder.registerContentGetterService(in: container)
        appServicesBuilder.registerUserDefaultsManager(in: container)
    }
}
