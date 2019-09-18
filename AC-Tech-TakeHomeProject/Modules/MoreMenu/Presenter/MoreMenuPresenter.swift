//
//  MoreMenuPresenter.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 15/09/2019.
//  Copyright © 2019 Company. All rights reserved.
//

import Foundation

protocol MoreMenuPresenterLogic {
    func getNumberOfRows() -> Int
    func getSettingItem(for indexPath: IndexPath) -> MoreMenuModel
    func updateActiveState(at index: Int, with activeState: Bool)
    func logout()
}

class MoreMenuPresenter {
    
    weak var view: MoreMenuViewControllerInput!
    var interactor: MoreMenuInteractorLogic!
    var router: MoreMenuRouterLogic!
    
    init(view: MoreMenuViewControllerInput, interactor: MoreMenuInteractorLogic, router: MoreMenuRouterLogic) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension MoreMenuPresenter: MoreMenuPresenterLogic {
    func getNumberOfRows() -> Int {
        return interactor.getNumberOfRows()
    }
    
    func getSettingItem(for indexPath: IndexPath) -> MoreMenuModel {
        return interactor.getSettingItem(for: indexPath)
    }
    
    func updateActiveState(at index: Int, with activeState: Bool) {
        interactor.updateActiveState(at: index, with: activeState)
    }
    
    func logout() {
        interactor.logout()
        router.redirectToLogin()
    }
}
