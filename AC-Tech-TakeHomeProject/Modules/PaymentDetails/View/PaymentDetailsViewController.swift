//
//  PaymentDetailsViewController.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 9/14/19.
//  Copyright © 2019 Alexei Sitalov. All rights reserved.
//

import UIKit

enum PaymentDetailsSection: Int {
    case general = 0
    case miscellaneous
}

private struct Constants {
    static let topHeaderHeight: CGFloat = 112
    static let sectionHeaderHeight: CGFloat = 70
}

protocol PaymentDetailsViewControllerInput: class {
    func configure(with viewModel: PaymentDetailsViewModel)
}

class PaymentDetailsViewController: BaseViewController {

    var presenter: PaymentDetailsPresenterLogic!

    @IBOutlet weak var tableView: UITableView!
    private lazy var paymentDetailsHeader = PaymentDetailsHeaderView.instantiate()
        as PaymentDetailsHeaderView
    private let sections: [PaymentDetailsSection] = [.general, .miscellaneous]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    // MARK: - Private methods
    private func setupViews() {
        title = "Payments Details"
        tableView.register(DetailsCommonTableViewCell.self)
        tableView.contentInsetAdjustmentBehavior = .always
    }
}

extension PaymentDetailsViewController: PaymentDetailsViewControllerInput {
    func configure(with viewModel: PaymentDetailsViewModel) {
        paymentDetailsHeader.configure(with: viewModel)
    }
}

// MARK: TableView delegate methods
extension PaymentDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if sections[section] == .general {
            return Constants.topHeaderHeight
        }
        return Constants.sectionHeaderHeight
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch sections[section] {
        case .general:
            return paymentDetailsHeader
        case .miscellaneous:
            let header = SectionHeaderWithTitle.instantiate() as SectionHeaderWithTitle
            header.config(with: "Miscellaneous")
            return header
        }
    }
}

// MARK: TableView dataSource methods
extension PaymentDetailsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let section = PaymentDetailsSection(rawValue: section) {
            return presenter.getNumberOfRows(for: section)
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as DetailsCommonTableViewCell
        if let section = PaymentDetailsSection(rawValue: indexPath.section) {
            cell.config(with: presenter.getDetail(at: indexPath, in: section))
        }
        return cell
    }
}
