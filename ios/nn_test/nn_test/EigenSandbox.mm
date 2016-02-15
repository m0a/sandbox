//
//  EigenSandbox.mm
//  nn_test
//
//  Created by m0a on 2015/08/26.
//  Copyright © 2015年 m0a. All rights reserved.
//

#import "EigenSandbox.h"
#import "Eigen/Core"
#import <iostream>
#import "EigenHelper.hpp"


using namespace std;
using namespace Eigen;

typedef Matrix<double, Dynamic, Dynamic, RowMajor> MD;

@implementation EigenSandbox
+ (void) eigenSandboxRun{
    cout << "eigenSandboxRun" <<endl;
    MD randData = MD::Random(4, 3).array() * 2;
    debug(randData);
    cout << randData <<endl;
    MD z = randData;
    debug(z)
    cout << z << endl;
    debug(sigmoid(z))
    cout << sigmoid(z) <<endl;
    debug(z)
    cout << z << endl;
    
    z = sigmoid(z);
    debug(z)
    cout << z << endl;

}
+ (void) _eigenSandboxRun{
    
    cout << "helloworld" << endl;
    MD a1 = MD::Ones(2,3);
    a1.block(0, 1, 2, 2) = MD::Random(2, 2);
    cout << a1 << endl;
    MD test(2,2);
    test(0,0) = 10;
    test(0,1) = -10;
    test(1,0) = 10;
    test(1,1) = -10;
    
    debug(test);
    
    MD result = sigmoid(test);
    debug(result);
    cout << result <<endl;

    
    
//    MD a2b(2,3);
//    a2b << 1,0,1,0,1,1;
//    
//    MD t2(2,2);
//    t2 << 7,-24,-7,14;
//    
//    cout << t2 * a2b <<endl;
    
    /*
     a2:3,1
     0.000911051
     0.000911051
     0.999089
     
     a2withBius:
     
     1 0.000911051
     1 0.000911051
     1    0.999089
     
     _t2 :
     
     7 -14
     -7  14
     
     a2withBius * _t2 :
     6.99362   -13.9872
     6.99362   -13.9872
     0.00637736 -0.0127547
     */
    
    
    

}

@end



