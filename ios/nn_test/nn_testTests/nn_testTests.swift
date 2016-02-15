//
//  nn_testTests.swift
//  nn_testTests
//
//  Created by m0a on 2015/08/19.
//  Copyright (c) 2015年 m0a. All rights reserved.
//

import UIKit
import XCTest
import Accelerate
//import LinearAlgebraExtensions




class nn_testTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    
    func _testDSPDiv() {
        let vecterA = [Double]([1,2,3,4,5,6,7,8,9,10])
        let vectorC = [Double](count: vecterA.count, repeatedValue: 0)
//        var result = Array<Float>(count: 256, repeatedValue: 0)
        let div = 10.0
        vDSP_vsdivD(
            UnsafePointer<Double>(vecterA),
            vDSP_Stride(1),
            UnsafePointer<Double>([div]),
            UnsafeMutablePointer<Double>(vectorC),
            vDSP_Stride(1),
            vDSP_Length(vecterA.count))
        
        print(vectorC)
        
        
    }
    
    func imageFromDoubleArray(buff:[Double], width:Int, height:Int,fileName:String)  {
        let size = CGSizeMake(CGFloat(width), CGFloat(height))
        UIGraphicsBeginImageContextWithOptions(size, true, 0)
        UIColor.whiteColor().setFill()
        UIRectFill(CGRectMake(0, 0, size.width, size.height))
        
        for y in 0 ..< height {
            for x in 0 ..< width {
                var pixelValue = CGFloat(abs(buff[y * width + x]))
                if pixelValue >= 1.0 {
                    pixelValue = 1.0
                }
                UIColor(red:pixelValue , green: pixelValue, blue: pixelValue, alpha: 1.0).setFill()
                UIRectFill(CGRectMake(CGFloat(x), CGFloat(y), 1, 1))
            }
        }
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        if image != nil {
            let data = UIImagePNGRepresentation(image)
            if let path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,
                NSSearchPathDomainMask.AllDomainsMask, true).first  {
                    let filepath = "\(path)/\(fileName)"
                    print("filepath = \(filepath)")
                    data?.writeToFile(filepath, atomically: true)
                    
            }
            
            
            
        }

        
    }
    
    func _testDataSaveImages(){
        let trainingData = loadMatrix("x.txt")
        var index = 0
        for line in trainingData {
            imageFromDoubleArray(line, width: 20, height: 20, fileName: "file_\(index).png")
            index++
        }
   
    }
    
    func _testSaveImage(){
        let size = CGSizeMake(20, 20)
        UIGraphicsBeginImageContextWithOptions(size, true, 0)
        UIColor.whiteColor().setFill()
        UIRectFill(CGRectMake(0, 0, size.width, size.height))
        
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        if image != nil {
            let data = UIImagePNGRepresentation(image)
            if let path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,
                NSSearchPathDomainMask.AllDomainsMask, true).first  {
                    let filepath = "\(path)/test.png"
                    print("filepath = \(filepath)")
                    data?.writeToFile(filepath, atomically: true)
                    
            }
            
            
            
        }
        
    }
    
    func _testNuralNet01(){
        let mat1 = la_matrix_from_double_array(loadMatrix("theta1.txt"))
        let mat2 = la_matrix_from_double_array(loadMatrix("theta2.txt"))
        let x = la_matrix_from_double_array(loadMatrix("x.txt"))
        let doulbe_y = loadMatrix("y.txt").flatMap { return $0 }
        var y = doulbe_y.map { Int($0)}
        
        let results = predict(mat1!, theta2: mat2!, x: x!)
        for i in 0..<y.count {
            if y[i] == results[i].result {
                print("correct!")
            } else {
                print("error:\(results[i]):\(y[i])")
            }
        }
        
        
    }
    func testMatrixA1() {
        let obj = la_matrix_from_double_array(
            [
                1,2,
                3,4,
            ], rows: 2, columns: 2)
        print(obj.ones_left_appends().matrixDescription)

        let obj2 = la_matrix_from_double_array(
            [
                1,2,3,4,
                5,6,7,8,
                1,1,1,1,
                3,3,3,3,
            ], rows: 4, columns: 4)
        print(obj2.ones_left_appends().matrixDescription)

        
    }
    func testSigmoidFunction() {
        
        let obj1 = la_matrix_from_double_array(
            [
                -900.0,900.0,
                -100.0,100.0,
            ], rows: 2, columns: 2)
        print(sigmoid(obj1).matrixDescription)
    }
    func testMatrixCal(){
//        let mat1 = loadMatrix("theta1.txt")
        let matrix = la_identity_matrix(3, la_scalar_type_t(LA_SCALAR_TYPE_DOUBLE), la_attribute_t(LA_DEFAULT_ATTRIBUTES))
        print(matrix)
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    func _testMtxPlusMtx(){
//        let obj1 = la_matrix_from_double_buffer(
//            [  1.0, 2.0, 3.0, 4.0,
//                5.0, 6.0 ,7.0 ,8.0,
//                9.0, 1.0, 2.0 ,3.0
//            ], 3,4,4,0,0)
        if let mat1 = la_matrix_from_double_array(loadMatrix("theta1.txt")) {
            print(mat1.matrixDescription)
            print(mat1.rows)
            print(mat1.cols)
            
        }
        
        
        
//        la_object_t.hello()
//
//        let obj2 = la_matrix_from_double_array(
//            [
//                1,2,3,4,
//                5,6,7,8,
//                1,1,1,1,
//            ], rows: 3, columns: 4)
//        
//        print(obj2.description2)
//        print(( obj1 + obj2 ).description2)
        
    }


    
    func _testLoadMatrix() {
        let mat1 = loadMatrix("theta1.txt")
        XCTAssertEqual(mat1.count, 25)
        XCTAssertEqual(mat1[0].count, 401)
        
        let mat2 = loadMatrix("theta2.txt")
        XCTAssertEqual(mat2.count, 10)
        XCTAssertEqual(mat2[0].count, 26)
        
        
    }
    
    func testImage() {
        let image = UIImage(named: "greenbox.png")
        print("size=\(image?.size)")
        print("color=\(image?.pixelColor(1, y: 1))")
    }
    
}
