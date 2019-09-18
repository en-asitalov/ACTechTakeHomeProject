//
//  PaymentsBuilderTests.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 15/09/2019.
//  Copyright © 2019 Company. All rights reserved.
//

import XCTest
@testable import AC-Tech-TakeHomeProject

class PaymentsBuilderTests: XCTestCase {
  
    override func setUp() {
        super.setUp()
    }
  
    override func tearDown() {
        super.tearDown()
    }
  
    func testConfigureModuleForViewController() {
        let builder = PaymentsBuilder()
        let viewController = builder.buildPaymentsViewController()
    
        XCTAssertNotNil(viewController, "PaymentsViewController is nil after configuration")
    }
}
