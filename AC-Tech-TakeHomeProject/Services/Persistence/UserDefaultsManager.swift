//
//  UserDefaultsManager.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 9/18/19.
//  Copyright © 2019 Alexei Sitalov. All rights reserved.
//

import Foundation

protocol UserDefaultsManager {
    func archivedData(with rootObject: Any, forKey: String)
    func unarchiveData(forKey: String) -> Any?
    func setBool(value: Bool, for key: String)
    func getBool(for key: String) -> Bool
}

class DefaultUserDefaultsManager: UserDefaultsManager {
    func archivedData(with rootObject: Any, forKey: String) {
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: rootObject)
        UserDefaults.standard.set(encodedData, forKey: forKey)
        UserDefaults.standard.synchronize()
    }
    
    func unarchiveData(forKey: String) -> Any? {
        if let decoded  = UserDefaults.standard.data(forKey: forKey) {
            return NSKeyedUnarchiver.unarchiveObject(with: decoded)
        }
        
        return nil
    }
    
    func setBool(value: Bool, for key: String) {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    func getBool(for key: String) -> Bool {
        return UserDefaults.standard.bool(forKey: key)
    }
}
