//
//  EigenHelper.cpp
//  nn_test
//
//  Created by m0a on 2015/08/26.
//  Copyright © 2015年 m0a. All rights reserved.
//

#include "EigenHelper.hpp"

MD sigmoid(MD z){
    
    //1.0 ./ (1.0 + exp(-z));
    z.array() *= -1;
    z = z.array().exp();
    z .array() += 1;
    z = z.array().inverse();
    return z;
}

MD sigmoidGradient(MD z) {
//g = sigmoid(z).*(ones(size(z)) - sigmoid(z));
    MD sigmoid_z = z;
    sigmoid_z = sigmoid(sigmoid_z);
    z = sigmoid_z.array() * (MD::Ones(z.rows(), z.cols()) - sigmoid_z).array();
    return z;
}