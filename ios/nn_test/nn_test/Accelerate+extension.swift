//
//  Accelerate+extension.swift
//  nn_test
//
//  Created by m0a on 2015/08/23.
//  Copyright © 2015年 m0a. All rights reserved.
//

import Foundation
import Accelerate


extension la_object_t  {
    public func ones_left_appends() -> la_object_t {
        let rows = self.rows
        let cols = self.cols
        let baseArray = self.toArray
        var newArray = [Double]()
        
        for row in 0..<rows {
            for column in 0..<cols {
                if column == 0 {
                    newArray.append(1.0)
                }
                newArray.append(baseArray[Int(row * cols + column)])
            }
        }
        
        return la_matrix_from_double_array(newArray, rows: rows, columns: cols+1)
    }
    
    /**
        transpose
    **/
    public var t : la_object_t {
        return la_transpose(self)
    }
}


/**
Construct a la_object_t for a matrix of dimensions rows x columns
:param: The array to use as the elements of the matrix
:param: The number of rows to construct the matrix
:param: The number of columns to construct the matrix
:returns: The la_object_t instance to use in matrix operations
*/
public func la_matrix_from_double_array(array: [Double], rows: UInt, columns: UInt) -> la_object_t {
    let columns = la_count_t(columns)
    let rows = la_count_t(rows)
    //    let totalElements = Int(rows * columns)
    
    let stride = columns
    var matrix: la_object_t!
    matrix = la_matrix_from_double_buffer(array, rows, columns, stride, 0, 0)
    
    return matrix
}

/**
Construct a la_object_t for a matrix of repeated values with dimensions rows x columns
:param: The array to use as the elements of the matrix
:param: The number of rows to construct the matrix, defaults to one
:param: The number of columns to construct the matrix, defaults to one
:returns: The la_object_t instance to use in matrix operations
*/
public func la_constant_matrix(value: Double, rows: UInt = 1, columns: UInt = 1) -> la_object_t {
    let matrixArray = [Double](count: Int(rows * columns), repeatedValue: value)
    return la_matrix_from_double_array(matrixArray, rows: rows, columns: columns)
}

/**
Construct a la_object_t for a matrix with all elements set to 0.0 of dimensions rows x columns
:param: The number of rows to construct the matrix, defaults to one
:param: The number of columns to construct the matrix, defaults to one
:returns: The la_object_t instance to use in matrix operations
*/
public func la_zero_matrix(rows: UInt = 1, columns: UInt = 1) -> la_object_t {
    return la_constant_matrix(0.0, rows: rows, columns: columns)
}


public func +(left:Double,right:la_object_t) -> la_object_t {
    let l = la_splat_from_double(left, la_attribute_t(LA_DEFAULT_ATTRIBUTES))
    return la_sum(l, right)
}


public func +(left:la_object_t,right:Double) -> la_object_t {
    let r = la_splat_from_double(right, la_attribute_t(LA_DEFAULT_ATTRIBUTES))
    return la_sum(left, r)
}


public func +(left:la_object_t,right:la_object_t) -> la_object_t {
        return la_sum(left, right)
}

public func -(left: la_object_t, right: la_object_t) -> la_object_t {
    return la_difference(left, right)
}

public func -(left: Double, right: la_object_t) -> la_object_t {
    return la_difference(la_splat_from_double(left, la_attribute_t(LA_DEFAULT_ATTRIBUTES)), right)
}

public func -(left: la_object_t, right: Double) -> la_object_t {
    return la_difference(left, la_splat_from_double(right, la_attribute_t(LA_DEFAULT_ATTRIBUTES)))
}

public func *(left: la_object_t, right: la_object_t) -> la_object_t {
    return la_matrix_product(left, right)
}

public func *(left: Double, right: la_object_t) -> la_object_t {
//    return la_matrix_product(la_splat_from_double(left, la_attribute_t(LA_DEFAULT_ATTRIBUTES)), right)
    return la_scale_with_double(right, left)
}

public func *(left: la_object_t, right: Double) -> la_object_t {
//    return la_matrix_product(left, la_splat_from_double(right, la_attribute_t(LA_DEFAULT_ATTRIBUTES)))
    return la_scale_with_double(left, right)
}


infix operator <*> { associativity left precedence 100 }

//public func >- <In, Out>(lhs: In, @noescape rhs: In -> Out) -> Out {
//    return rhs(lhs)
//}


public func <*> (left: la_object_t, right: la_object_t) -> la_object_t {
    return la_inner_product(left, right)
}



public func log(obj:la_object_t) -> la_object_t {
    return la_matrix_from_double_array(obj.toArray.map { log($0)}, rows: obj.rows, columns: obj.cols)    
}



