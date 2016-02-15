//
//  octaveSupport.swift
//  nn_test
//
//  Created by m0a on 2015/08/21.
//  Copyright © 2015年 m0a. All rights reserved.
//

import Foundation
import Accelerate
import UIKit


func loadString(filename:String) -> String? {
    let resoucePath = NSBundle.mainBundle().resourcePath
    if let filePath = resoucePath?.stringByAppendingString("/\(filename)") {
        do {
            let data = try String(contentsOfFile: filePath)
            return data
        } catch {
            return nil
        }
    }
    return nil
}




/*
    octave matrix load  ex. octave use comand:save -text file.txt matrixVar

*/
func loadMatrix(filename:String) -> [[Double]] {
    var array = [[Double]]()
    //        var rowIndex = 0
    
    if let strings = loadString(filename) {
        strings.enumerateLines({ (line, stop) -> () in
            
            if line.hasPrefix("#") {
                return
            }
            
            
            let data = line.componentsSeparatedByString(" ")
            if  data.count > 0 {
                
                var appendArray = [Double]()
                for d in data {
                    if let dd = Double(d) {
                        appendArray.append(dd)
                    }
                }
                
                if appendArray.count > 0 {
                    array.append(appendArray)
//                    let ac = array[rowIndex].count
//                    print("row:\(rowIndex),count:\(ac)\n")
//                    rowIndex++
                }
            }
            
        })
        
    }
    return array
    
}


func la_matrix_from_double_array(array:[[Double]]) -> la_object_t? {
    let rows = array.count
    let columns = array.first?.count ?? 1
    //		let totalElements = Int(rows * columns)
    
    let grid = array.flatMap { $0 }
    
    
    
//    return la_matrix_from_double_array(grid, rows: rows, columns: columns)
    let obj = la_matrix_from_double_buffer(grid, la_count_t(rows), la_count_t(columns),
        la_count_t(columns), la_hint_t(LA_NO_HINT), la_attribute_t(LA_DEFAULT_ATTRIBUTES))
    if obj != nil {
        return obj
    }
    
    return nil

}


extension la_object_t {
    final public var rows: UInt {
        return UInt(la_matrix_rows(self))
    }
    
    final public var cols: UInt {
        return UInt(la_matrix_cols(self))
    }
    
    final public var toArray: [Double] {
        var arrayBuf = [Double](count: Int(rows * cols), repeatedValue: 0.0)
        la_matrix_to_double_buffer(&arrayBuf, cols, self)
        return arrayBuf
    }
    
    final public var matrix: [[Double]] {
        var matrix = [[Double]]()
        for row in 1...rows {
            let firstCol = Int(cols * (row - 1))
            let lastCol = Int(cols * row - 1)
            let partCols = Array(toArray[firstCol...lastCol])
            matrix.append(partCols)
        }
        return matrix
    }
    
    
    final public var matrixDescription: String {
        return matrix.reduce("")
            {(acc, rowVals) in
                acc +
                    rowVals.reduce(""){(ac, colVal) in ac + "\(colVal) "} +
                "\n"
        }
    }
}

extension UIImage {
    func saveImage(fileName:String) {
        
        let image = self
        let data = UIImagePNGRepresentation(image)
        if let path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,
            NSSearchPathDomainMask.AllDomainsMask, true).first  {
                let filepath = "\(path)/\(fileName)"
                print("filepath = \(filepath)")
                data?.writeToFile(filepath, atomically: true)
                
        }
        
    }
    
}

func imageFromDoubleArray(buff:[Double], width:Int, height:Int) -> UIImage? {
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
    if image != nil {
        return image
    }
    return nil
}

func saveImageFromDoubleArray(buff:[Double], width:Int, height:Int,fileName:String)  {
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
