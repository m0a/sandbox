//
//  SigmoidFunctionTests.swift
//  nn_test
//
//  Created by m0a on 2015/08/23.
//  Copyright © 2015年 m0a. All rights reserved.
//

import XCTest

class SigmoidFunctionTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

//    func testExample() {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }

    func testPerformanceSigmoidFunctionOld() {

        let matrex_length = 50
        let dArray = [Double](count: matrex_length, repeatedValue: 22.0)
        guard let target = la_matrix_from_double_array([[Double]](count: matrex_length, repeatedValue:dArray)) else {
                return
            }
        self.measureBlock {
            for _ in 0 ..< 5000 {
              sigmoid(target)
            }
        }
    }

}
