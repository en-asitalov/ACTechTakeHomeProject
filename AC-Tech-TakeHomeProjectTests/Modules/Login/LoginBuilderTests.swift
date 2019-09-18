//
//  LoginBuilderTests.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 14/09/2019.
//  Copyright © 2019 Company. All rights reserved.
//

import XCTest
@testable import AC-Tech-TakeHomeProject

class LoginBuilderTests: XCTestCase {
  
    override func setUp() {
        super.setUp()
    }
  
    override func tearDown() {
        super.tearDown()
    }
  
    func testConfigureModuleForViewController() {
        let builder = LoginBuilder()
        let viewController = builder.buildLoginViewController()
    
        XCTAssertNotNil(viewController, "LoginViewController is nil after configuration")
    }
}
