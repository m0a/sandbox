//
//  EigenNuralNetworkTests.swift
//  nn_test
//
//  Created by m0a on 2015/08/26.
//  Copyright © 2015年 m0a. All rights reserved.
//

import XCTest

class EigenNuralNetworkTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testPredictNotNot() {
        let nn = EigenNuralNtwork(inputLSize: Int32(1), hiddenLSize: Int32(1), outputLSize: Int32(2))
        nn.theta1 = [-7.0, 14.0]
        
        nn.theta2 = [
            7.0, -14.0,
            -7.0, 14.0
        ]
        let x = [0.0 ,1.0 ,1.0 ,1.0 ,1.0 ,0.0]
        let y = [0,1,1,1,1,0]
        let data = nn.predictwithX(x)
        guard let result = data["index"] as? [Int] else {
            XCTAssert(false, "error")
            return
        }
        XCTAssertEqual(result, y)


    }
    
    func testPredictAnd() {
        
        
        let nn = EigenNuralNtwork(inputLSize: Int32(2), hiddenLSize: Int32(1), outputLSize: Int32(2))
        nn.theta1 = [-21.0, 14.0, 14.0]
        nn.theta2 = [
            7.0, -14.0,
            -7.0, 14.0
        ]
        //and logic
        let x = [
            1.0, 0.0,
            0.0, 1.0,
            1.0, 1.0,
            0.0, 0.0,
            1.0, 1.0,
            1.0, 1.0,
            1.0, 1.0,
        ]
        
        
        let y = [
            0,
            0,
            1,
            0,
            1,
            1,
            1
        ]
        
        let data = nn.predictwithX(x)
        guard let result = data["index"] as? [Int] else {
            XCTAssert(false, "error")
            return
        }
        XCTAssertEqual(result, y)
        
        
    }
    
    func testPredict() {
        
        let x = (loadMatrix("x.txt").flatMap { $0 })
        
        let theta1 = loadMatrix("theta1.txt").flatMap { $0 }
        let theta2 = loadMatrix("theta2.txt").flatMap { $0 }
        
        let nn = EigenNuralNtwork()
        nn.theta1 = theta1
        nn.theta2 = theta2
        
        let data = nn.predictwithX(x)
//        print(data)
        guard let result = data["index"] as? [Int] else {
            XCTAssert(false, "error")
            return
        }
        
        guard let persentage = data["persentage"] as? [Double] else {
            XCTAssert(false, "error")
            return
        }

        
        let y = (loadMatrix("y.txt").flatMap { $0 }).map { Int($0 - 1)}
        var errorCnt = 0.0
        for i in 0 ..< y.count where y[i] != result[i] {
            print("error:\(i) p:\(persentage[i])")
            errorCnt += 1.0
        }
        
        XCTAssertGreaterThan((Double(result.count) - errorCnt) / Double(result.count) , 0.8, "not correct ")
        
        
        
        
    
        
    }
    
    func testTheta1() {
        let i = 3;
        let h = 2;
        let o = 2;
        
        {
//            var theta1 = [Double]()
//            for _ in 0 ..< ((i + 1) * h) {
//                theta1.append(Double(rand())/Double(RAND_MAX))
//            }
//            
//            var theta2 = [Double]()
//            for _ in 0 ..< ((h + 1) * o) {
//                theta2.append(Double(rand())/Double(RAND_MAX))
//            }
            let theta1 = [1,1,2,3,1,4,5,6].map { return Double($0) }
            let theta2 = [1,1,2,3,4,5].map { return Double($0)}
            
            let nn = EigenNuralNtwork(inputLSize: Int32(i), hiddenLSize: Int32(h), outputLSize: Int32(o))
            nn.theta1 = theta1;
            nn.theta2 = theta2;
            
//            print(nn.theta1)
//            print(nn.theta2)
//            
            nn.Theta1memory()
            nn.Theta2memory()
            
            XCTAssertEqual(nn.theta1, theta1)
            XCTAssertEqual(nn.theta2, theta2)
            
            
            }()
        
    }
    func testSetAndGetTheta(){
        var i = 400;
        var h = 30;
        var o = 15;

        {
            var theta1 = [Double]()
            for _ in 0 ..< ((i + 1) * h) {
                theta1.append(Double(rand())/Double(RAND_MAX))
            }
            
            var theta2 = [Double]()
            for _ in 0 ..< ((h + 1) * o) {
                theta2.append(Double(rand())/Double(RAND_MAX))
            }
            
            
            let nn = EigenNuralNtwork(inputLSize: Int32(i), hiddenLSize: Int32(h), outputLSize: Int32(o))
            nn.theta1 = theta1;
            nn.theta2 = theta2;
            
            XCTAssertEqual(nn.theta1, theta1)
            XCTAssertEqual(nn.theta2, theta2)
        }()
        
        i = 100;
        h = 33;
        o = 20;
        
        {
            var theta1 = [Double]()
            for _ in 0 ..< ((i + 1) * h) {
                theta1.append(Double(rand())/Double(RAND_MAX))
            }
            
            var theta2 = [Double]()
            for _ in 0 ..< ((h + 1) * o) {
                theta2.append(Double(rand())/Double(RAND_MAX))
            }
            
            
            let nn = EigenNuralNtwork(inputLSize: Int32(i), hiddenLSize: Int32(h), outputLSize: Int32(o))
            nn.theta1 = theta1;
            nn.theta2 = theta2;
            
            XCTAssertEqual(nn.theta1, theta1)
            XCTAssertEqual(nn.theta2, theta2)
        }()
        

//        nn.theta1 = 
//        nn.theta1 =
        
    }
    
    func testInit() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        var i:Int32 = 10;
        var h:Int32 = 20;
        var o:Int32 = 30;
        
        var nn = EigenNuralNtwork(inputLSize: i, hiddenLSize: h, outputLSize: o)
        XCTAssertEqual(nn.theta1.count, Int((i + 1) * h ))
        XCTAssertEqual(nn.theta2.count, Int((h + 1) * o))
        
        i = 12;
        h = 24;
        o = 15;
        
        nn = EigenNuralNtwork(inputLSize: i, hiddenLSize: h, outputLSize: o)
        XCTAssertEqual(nn.theta1.count, Int((i + 1) * h ))
        XCTAssertEqual(nn.theta2.count, Int((h + 1) * o))

    }
    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measureBlock {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
}
