//
//  UIImage+extension.swift
//  nn_test
//
//  Created by m0a on 2015/08/21.
//  Copyright © 2015年 m0a. All rights reserved.
//

import UIKit

extension UIImage {
    func pixelGrayscaleArray() -> [Double] {
        
        var results = [Double]()
        for y in 0 ..< Int(self.size.height) {
            for x in 0 ..< Int(self.size.width) {
                if let color = self.pixelColor(x, y: y) {
                    let gray = Double((color.red + color.green + color.blue)/3.0)
                    results.append(gray)
                }
            }
        }
        return results
    }
    func pixelColor(x:Int,y:Int) -> (red:Double,green:Double,blue:Double)? {
        let dataProvider = CGImageGetDataProvider(self.CGImage)
        let dataRef = CGDataProviderCopyData(dataProvider)
        let buffer = CFDataGetBytePtr(dataRef!)
        let bytesPerRow = CGImageGetBytesPerRow(self.CGImage)
        
        if x < 0 || x > Int(self.size.width) {
            return nil
        }
        
        if y < 0 || x > Int(self.size.height) {
            return nil
        }
        
        
        
        let pixelPtr = buffer + y * bytesPerRow + x * 4
        let r = (pixelPtr + 2).memory
        let g = (pixelPtr + 1).memory
        let b = (pixelPtr + 0).memory
        return (red:Double(r)/255.0,green:Double(g)/255.0,blue:Double(b)/255.0)
//        return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: CGFloat(1.0))
        
        
        
        //        for (var x = CGFloat(0) ; x < self.size.width; x++ ) {
        //            for (var y = CGFloat(0) ; y < self.size.height; y++ ) {
        //                let pixelPtr = buffer + Int(y) * bytesPerRow + Int(x) * 4
        //                let r = (pixelPtr + 2).memory
        //                let g = (pixelPtr + 1).memory
        //                let b = (pixelPtr + 0).memory
        //                print("x,y=(\(x),\(y)) r=\(r),g=\(g),b=\(b)\n")
        //
        //                
        //            }
        
        //        }
        
    }
}
