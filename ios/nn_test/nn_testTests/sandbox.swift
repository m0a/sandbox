//
//  sandbox.swift
//  nn_test
//
//  Created by m0a on 2015/08/26.
//  Copyright © 2015年 m0a. All rights reserved.
//

import XCTest


class sandbox: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSandBox() {
        EigenSandbox.eigenSandboxRun()
    }
    
    
}
