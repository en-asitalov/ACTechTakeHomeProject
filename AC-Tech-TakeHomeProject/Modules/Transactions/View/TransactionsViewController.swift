//
//  TransactionsViewController.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 15/09/2019.
//  Copyright © 2019 Company. All rights reserved.
//

import UIKit
import MBProgressHUD

private struct Constants {
    static let rowHeight: CGFloat = 93
}

protocol TransactionsViewControllerInput: class {
    
}

class TransactionsViewController: BaseViewController, TransactionsViewControllerInput {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: TransactionsPresenterLogic!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.register(TransactionTableViewCell.self)
    }
}

// MARK: - TableView DataSource
extension TransactionsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return presenter.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as TransactionTableViewCell
        let model = presenter.getTransaction(at: indexPath.row)
        cell.config(with: model)
        return cell
    }
}

// MARK: - TableView Delegate
extension TransactionsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectItem(with: presenter.getTransaction(at: indexPath.row).transactionId)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.rowHeight
    }
}
