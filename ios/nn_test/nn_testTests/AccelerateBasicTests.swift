//
//  AccelerateBasicTests.swift
//  nn_test
//
//  Created by m0a on 2015/08/23.
//  Copyright © 2015年 m0a. All rights reserved.
//

import XCTest

class AccelerateBasicTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testProduct01() {
        let obj = la_matrix_from_double_array([Double](count: 4, repeatedValue: 2.0), rows: 2, columns: 2)
        print((3 * obj).matrixDescription)
        
    }
    
    
    func testPlus02(){
        let obj2 = la_matrix_from_double_array([Double](count: 4, repeatedValue: 2.0), rows: 2, columns: 2)
        print((1 + obj2).matrixDescription)
    }

    
    func testPlus01(){
        let obj1 = la_matrix_from_double_array([Double](count: 4, repeatedValue: 1.0), rows: 2, columns: 2)
        let obj2 = la_matrix_from_double_array([Double](count: 4, repeatedValue: 2.0), rows: 2, columns: 2)
        print((obj1 + obj2).matrixDescription)

    }



//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measureBlock {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
