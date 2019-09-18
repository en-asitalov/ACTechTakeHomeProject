//
//  TransactionsPresenterTests.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 15/09/2019.
//  Copyright © 2019 Company. All rights reserved.
//

import XCTest
@testable import AC-Tech-TakeHomeProject

class TransactionsPresenterTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    class MockInteractor: TransactionsInteractor {

    }

    class MockRouter: TransactionsRouter {

    }

    class MockViewController: TransactionsViewController {

    }
}
