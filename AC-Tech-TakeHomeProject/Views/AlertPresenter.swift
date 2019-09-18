//
//  AlertPresenter.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 9/16/19.
//  Copyright © 2019 Alexei Sitalov. All rights reserved.
//

import UIKit

/**
 * This protocol should be implemented only by UIViewControllers
 */
protocol AlertCompliantViewController: class {
    var alertPresenter: AlertPresenter? { get }
}

extension AlertCompliantViewController {
    func showAlert(_ title: String?, message: String?) {
        alertPresenter?.showAlert(title, message: message)
    }
}

protocol AlertPresenter {
    func showAlert(_ title: String?, message: String?)
}

struct DefaultAlertPresenter: AlertPresenter {
    
    fileprivate var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }

    func showAlert(_ title: String?, message: String?) {
        if let viewController = viewController {
            let alert = UIAlertController(title: title,
                                          message: message,
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            
            viewController.present(alert, animated: true, completion: nil)
        }
    }
}
