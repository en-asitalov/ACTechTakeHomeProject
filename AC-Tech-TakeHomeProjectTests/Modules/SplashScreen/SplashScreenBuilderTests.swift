//
//  SplashScreenBuilderTests.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 14/09/2019.
//  Copyright © 2019 Company. All rights reserved.
//

import XCTest
@testable import AC-Tech-TakeHomeProject

class SplashScreenBuilderTests: XCTestCase {
  
    override func setUp() {
        super.setUp()
    }
  
    override func tearDown() {
        super.tearDown()
    }
  
    func testConfigureModuleForViewController() {
        let builder = SplashScreenBuilder()
        let viewController = builder.buildSplashScreenViewController()
    
        XCTAssertNotNil(viewController, "SplashScreenViewController is nil after configuration")
    }
}
