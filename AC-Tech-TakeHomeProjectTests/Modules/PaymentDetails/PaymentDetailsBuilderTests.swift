//
//  PaymentDetailsBuilderTests.swift
//  AC-Tech-TakeHomeProject
//
//  Created by y on 15/09/2019.
//  Copyright © 2019 Company. All rights reserved.
//

import XCTest
@testable import AC-Tech-TakeHomeProject

class PaymentDetailsBuilderTests: XCTestCase {
  
    override func setUp() {
        super.setUp()
    }
  
    override func tearDown() {
        super.tearDown()
    }
  
    func testConfigureModuleForViewController() {
        let builder = PaymentDetailsBuilder()
        let viewController = builder.buildPaymentDetailsViewController()
    
        XCTAssertNotNil(viewController, "PaymentDetailsViewController is nil after configuration")
    }
}
