//
//  NuralNetworkTests.swift
//  nn_test
//
//  Created by m0a on 2015/08/25.
//  Copyright © 2015年 m0a. All rights reserved.
//

import XCTest

class NuralNetworkTests: XCTestCase {

    let x = loadMatrix("x.txt").flatMap { $0 }
    let y = loadMatrix("y.txt").flatMap { $0 }.map { Int($0) }
//    var y = doulbe_y.map { Int($0)}

    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testCost01() {
        
        let nn = NuralNetwork()
        try! nn.cost(x, inputY: y, lambda: 0.0)
        
    }
    
    func testNNReset() {
        let nn = NuralNetwork()
        nn.reset(3, hiddenLayerSize: 2, outputLayerSize: 1)
        XCTAssertEqual(String(nn), "NN{input:3,hiddin:2,output:1,trainningDone:false}")
        
        
    }
    func testNNdescription() {
        let nn = NuralNetwork()
        print(nn)
        debugPrint(nn)
    }
    
    func testExpandBool() {
        let nn = NuralNetwork()
        let input = [9,8,7,6,5,4,3,2,1,0]
        let y = nn.expandBoolArrayOutput(input)
        let test = y.map { (i:[Bool]) -> Int in
            if let ret = i.indexOf(true)  {
                return ret
            }
            
            return 0
        }
        debugPrint(input)
        debugPrint(test)
        
        XCTAssertEqual(input, test)
    }

}
