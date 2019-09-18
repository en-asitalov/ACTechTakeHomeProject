//
//  PaymentsViewController.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 15/09/2019.
//  Copyright © 2019 Company. All rights reserved.
//

import UIKit
import MBProgressHUD

private struct Constants {
    static let rowHeight: CGFloat = 86
}

protocol PaymentsViewControllerInput: class {

}

class PaymentsViewController: BaseViewController, PaymentsViewControllerInput {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: PaymentsPresenterLogic!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.register(PaymentCell.self)
    }
}

// MARK: - TableView DataSource
extension PaymentsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return presenter.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as PaymentCell
        let model = presenter.getPayment(at: indexPath.row)
        cell.config(with: model)
        return cell
    }
}

// MARK: - TableView Delegate
extension PaymentsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectItem(with: presenter.getPayment(at: indexPath.row).paymentId)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.rowHeight
    }
}
