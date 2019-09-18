//
//  TransactionDetailsViewController.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 9/14/19.
//  Copyright © 2019 Alexei Sitalov. All rights reserved.
//

import UIKit

enum TransactionDetailsSection: Int {
    case general = 0
    case paymentDetail
    case merchantReference
    case miscellaneous
}

private struct Constants {
    static let topHeaderHeight: CGFloat = 130
    static let sectionHeaderHeight: CGFloat = 70
}

protocol TransactionDetailsViewControllerInput: class {
    func configure(with viewModel: TransactionDetailsViewModel)
}

final class TransactionDetailsViewController: BaseViewController {
    
    @IBOutlet weak var transactionDetailsTableView: UITableView!
    
    private lazy var transactionDetailsHeader =
        TransactionDetailsHeaderView.instantiate() as TransactionDetailsHeaderView
    private let sections: [TransactionDetailsSection] = [.general, .paymentDetail, .merchantReference, .miscellaneous]
    var presenter: TransactionDetailsPresenterLogic!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        title = "Transaction Details"
        setLargeNavigationBar()
        transactionDetailsTableView.register(DetailsCommonTableViewCell.self)
        transactionDetailsTableView.contentInsetAdjustmentBehavior = .always
    }
}

extension TransactionDetailsViewController: TransactionDetailsViewControllerInput {
    func configure(with viewModel: TransactionDetailsViewModel) {
        transactionDetailsHeader.configure(with: viewModel)
    }
}

// MARK: TableView delegate methods
extension TransactionDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return sections[section] == .general ? Constants.topHeaderHeight : Constants.sectionHeaderHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = SectionHeaderWithTitle.instantiate() as SectionHeaderWithTitle
        switch sections[section] {
        case .general:
            return transactionDetailsHeader
        case .paymentDetail:
            header.config(with: "Payment detail")
            return header
        case .merchantReference:
            header.config(with: "Merchant reference")
            return header
        case .miscellaneous:
            header.config(with: "Miscellaneous")
            return header
        }
    }
}

// MARK: TableView dataSource methods
extension TransactionDetailsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        if let section = TransactionDetailsSection(rawValue: section) {
            return presenter.getNumberOfRows(for: section)
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as DetailsCommonTableViewCell
        if let section = TransactionDetailsSection(rawValue: indexPath.section) {
            cell.config(with: presenter.getDetail(at: indexPath, in: section))
        }
        return cell
    }
}
