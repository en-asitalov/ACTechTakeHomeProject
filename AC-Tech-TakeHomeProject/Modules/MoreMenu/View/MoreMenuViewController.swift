//
//  MoreMenuViewController.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 15/09/2019.
//  Copyright © 2019 Company. All rights reserved.
//

import UIKit
import MBProgressHUD

private struct Constants {
    static let footerViewHeight: CGFloat = 56
}

protocol MoreMenuViewControllerInput: class {
    
}

class MoreMenuViewController: BaseViewController, MoreMenuViewControllerInput {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: MoreMenuPresenterLogic!
    
    private var logoutFooterView = LogoutFooterView.instantiate() as LogoutFooterView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupFooterView()
    }
    
    // MARK: - Private methods
    private func setupTableView() {
        tableView.register(MoreMenuCell.self)
        tableView.tableFooterView = UIView()
    }
    
    private func setupFooterView() {
        logoutFooterView.config { [weak self] in
            self?.presenter.logout()
        }
    }
}

// MARK: - UITableViewDataSource
extension MoreMenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as MoreMenuCell
        let model = presenter.getSettingItem(for: indexPath)
        cell.config(with: model)
        cell.switchValueChanged = { [weak self] activeState in
            self?.presenter.updateActiveState(at: indexPath.row, with: activeState)
        }
        return cell
    }
}

extension MoreMenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return logoutFooterView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return Constants.footerViewHeight
    }
}
