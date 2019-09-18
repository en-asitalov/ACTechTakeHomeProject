//
//  LogoutFooterView.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 15/09/2019.
//  Copyright © 2019 Company. All rights reserved.
//

import UIKit

typealias ActionClosure = (() -> Void)?

class LogoutFooterView: UIView, NibLoadableView {
    
    @IBOutlet weak var logoutButton: UIButton!
    
    private var confirmAction: ActionClosure = nil
    private var isEnabled: Bool = false
    
    func config(with action: ActionClosure) {
        confirmAction = action
        setupTitles()
    }
    
    // MARK: - Private methods
    private func setupTitles() {
        logoutButton.setTitle("Logout", for: .normal)
    }
    
    @IBAction func didTapLogoutButton(_ sender: UIButton) {
        confirmAction?()
    }
}
