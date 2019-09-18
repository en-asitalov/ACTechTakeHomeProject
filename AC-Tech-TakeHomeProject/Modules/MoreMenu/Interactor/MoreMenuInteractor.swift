//
//  MoreMenuInteractor.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 15/09/2019.
//  Copyright © 2019 Company. All rights reserved.
//

import Foundation

protocol MoreMenuInteractorLogic {
    func logout()
    func getNumberOfRows() -> Int
    func getSettingItem(for indexPath: IndexPath) -> MoreMenuModel
    func updateActiveState(at index: Int, with activeState: Bool)
}

class MoreMenuInteractor {

    private let keychainService: KeychainService
    private let userDefaultsManager: UserDefaultsManager
    private var settingItems: [MoreMenuModel] = []
    
    init(keychainService: KeychainService,
         userDefaultsManager: UserDefaultsManager) {
        self.keychainService = keychainService
        self.userDefaultsManager = userDefaultsManager
        setupItems()
    }
    
    private func getUsername() -> String {
        let credentials = keychainService.fetchLoginData()
        if let username = credentials.username {
            return username
        }
        return ""
    }
    
    private func setupItems() {
        if let decodedItems = userDefaultsManager.unarchiveData(forKey: getUsername()) {
            settingItems = (decodedItems as! [MoreMenuModel])
            return
        }
        
        settingItems = [
            MoreMenuModel(title: "Enable Notifications"),
            MoreMenuModel(title: "Enable Email messages"),
            MoreMenuModel(title: "Enable Attachments enabled"),
            MoreMenuModel(title: "Enable Transactions"),
            MoreMenuModel(title: "Enable Payments")
        ]
    }
}

extension MoreMenuInteractor: MoreMenuInteractorLogic {
    func getNumberOfRows() -> Int {
        return settingItems.count
    }
    
    func getSettingItem(for indexPath: IndexPath) -> MoreMenuModel {
        if let decodedItems = userDefaultsManager.unarchiveData(forKey: getUsername()) {
            return (decodedItems as! [MoreMenuModel])[indexPath.row]
        }
        return settingItems[indexPath.row]
    }
    
    func updateActiveState(at index: Int, with activeState: Bool) {
        settingItems[index].activeState = activeState
        userDefaultsManager.archivedData(with: settingItems, forKey: getUsername())
    }
    
    func logout() {
        keychainService.removeLoginData()
    }
}
