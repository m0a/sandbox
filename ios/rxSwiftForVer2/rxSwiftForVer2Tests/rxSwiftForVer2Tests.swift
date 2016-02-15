//
//  rxSwiftForVer2Tests.swift
//  rxSwiftForVer2Tests
//
//  Created by m0a on 2015/08/28.
//  Copyright © 2015年 m0a. All rights reserved.
//

import XCTest
import RxCocoa
import RxSwift


@testable import rxSwiftForVer2

class rxSwiftForVer2Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
//        let subscriber = rx_re
        let a = Variable(1)
        let b = Variable(2)
        
        let c = combineLatest(a, b, +)
        var latestValue: Int?
        
        c >- subscript
        
//        let subscription = c >- subscribeNext { next in
//            latestValue = next
//        }
//
//        XCTAssertEqual(latestValue!, 3)
//        
//        a.next(5)
//        
//        XCTAssertEqual(latestValue!, 7)
//        
//        b.next(9)
//        
//        XCTAssertEqual(latestValue!, 14)
//        
//        subscription.dispose()
//        
//        a.next(10)
//        
//        XCTAssertEqual(latestValue!, 14)

        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
