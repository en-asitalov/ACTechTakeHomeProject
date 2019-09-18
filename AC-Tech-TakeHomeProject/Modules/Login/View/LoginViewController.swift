//
//  LoginViewController.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 14/09/2019.
//  Copyright © 2019 Company. All rights reserved.
//

import UIKit
import MBProgressHUD

protocol LoginViewControllerInput: AlertCompliantViewController {
    func showLoading()
    func hideLoading()
}

class LoginViewController: UIViewController {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var usernameTextField: LoginTextField!
    @IBOutlet weak var passwordTextField: LoginTextField!
    @IBOutlet weak var usernameTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewBottomConstraint: NSLayoutConstraint!
    
    lazy var alertPresenter: AlertPresenter? = DefaultAlertPresenter(viewController: self)
    
    var presenter: LoginPresenterLogic!
    
    private let backgroundImageView = UIImageView()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let isLandscape = view.frame.size.width > view.frame.size.height
        logoImageView.isHidden = isLandscape
        usernameTopConstraint.isActive = isLandscape
        imageViewBottomConstraint.isActive = !isLandscape
    }
    
    @IBAction func didTapLogin(_ sender: LoginButton) {
        presenter.validateCredentials(for: usernameTextField.text, password: passwordTextField.text)
    }
}

extension LoginViewController: LoginViewControllerInput {
    func showLoading() {
        MBProgressHUD.showAdded(to: view, animated: true)
    }
    
    func hideLoading() {
        MBProgressHUD.hide(for: view, animated: true)
    }
}

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
