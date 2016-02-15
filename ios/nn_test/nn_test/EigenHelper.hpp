//
//  EigenHelper.hpp
//  nn_test
//
//  Created by m0a on 2015/08/26.
//  Copyright © 2015年 m0a. All rights reserved.
//

#ifndef EigenHelper_hpp
#define EigenHelper_hpp


#import "Eigen/Core"
#import <iostream>

#define INIT_EPSILON (0.05)


using namespace std;
using namespace Eigen;

typedef Matrix<double, Dynamic, Dynamic, RowMajor> MD;

#define debug(a) cout << #a <<":" << a.rows() << ","  << a.cols() << endl;
//#define view(a)  cout << #a <<":" << a.rows() << ","  << a.cols() << endl;


MD sigmoid(MD z);
MD sigmoidGradient(MD z);


#endif /* EigenHelper_hpp */

