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
}
