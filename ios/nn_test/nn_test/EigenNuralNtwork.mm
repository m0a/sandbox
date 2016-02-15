//
//  EigenNuralNetwork.m
//  nn_test
//
//  Created by m0a on 2015/08/26.
//  Copyright © 2015年 m0a. All rights reserved.
//

#import "EigenNuralNetwork.h"
#import "Eigen/Core"
#import <iostream>
#import "EigenHelper.hpp"

#define INIT_EPSILON (0.05)


using namespace std;
using namespace Eigen;

typedef Matrix<double, Dynamic, Dynamic, RowMajor> MD;




@interface EigenNuralNtwork ()

@property int inputLSize;
@property int hiddenLSize;
@property int outputLSize;



@end

@implementation EigenNuralNtwork

// theta
MD _t1;
MD _t2;


- (nonnull instancetype)init
{
    self = [super init];
    if (self) {
        self = [self initWithInputLSize:400 hiddenLSize:25 outputLSize:10];
    }
    return self;
}


-(MD) getMD:(NSArray<NSNumber*> * _Nonnull) input rows:(int)rows cols:(int) cols{
    
    MD X(rows,cols);
    for (int row = 0; row < rows; row ++) {
        for (int col = 0; col < cols; col ++) {
            X(row,col) = [input[cols * row + col] doubleValue];
        }
    }
    return X;
    
}


- (void) setTheta1:(NSArray<NSNumber *> * _Nonnull)theta1 {
    
    _t1 = [self getMD:theta1 rows:self.hiddenLSize cols:self.inputLSize + 1];
}

-(NSArray<NSNumber*>* _Nonnull) theta1 {
    
    NSMutableArray<NSNumber*>* array =[NSMutableArray array];
    double* t1 = _t1.data();
    
    for (int i = 0; i < (self.inputLSize + 1) * self.hiddenLSize; i++) {
        [array addObject:@(t1[i])];
    }
    
    return array;
}


- (void) setTheta2:(NSArray<NSNumber *> * _Nonnull)theta2 {
    _t2 = [self getMD:theta2 rows:self.outputLSize cols:self.hiddenLSize + 1];
}

-(NSArray<NSNumber*>* _Nonnull) theta2 {
    
    NSMutableArray<NSNumber*>* array =[NSMutableArray array];
    double* t2 = _t2.data();
    for (int i = 0; i < (self.hiddenLSize + 1) * self.outputLSize; i++) {
        [array addObject:@(t2[i])];
    }
    
    return array;
    
}


- (nonnull instancetype) initWithInputLSize:(int) inputLSize
                        hiddenLSize:(int) hiddenLSize
                        outputLSize:(int) outputLSize {
    self = [super init];
    if (self) {
        
        
        self.inputLSize = inputLSize;
        self.hiddenLSize = hiddenLSize;
        self.outputLSize = outputLSize;
        [self resetTheta];
        
        
    }
    return self;
    
}

-(void) resetTheta {
    //params make
    _t1 = MD::Random(self.hiddenLSize, self.inputLSize + 1).array() * INIT_EPSILON;
    _t2 = MD::Random(self.outputLSize, self.hiddenLSize + 1).array() * INIT_EPSILON;
}

-(void) Theta1memory {
    cout << "t1:";
    double* data = _t1.data();
    for (int i = 0; i< self.hiddenLSize * (self.inputLSize + 1); i++ ) {
        cout << data[i] << ",";
    }
    cout << endl;
}
-(void) Theta2memory {
    cout << "t2:";
    double* data = _t2.data();
    for (int i = 0; i< self.outputLSize * (self.hiddenLSize + 1); i++ ) {
        cout << data[i] << ",";
    }
    cout << endl;
}


-(NSDictionary<NSString*,NSArray*> *  _Nonnull) predictwithX:(NSArray<NSNumber*> * _Nonnull) inputX {
    
    int inputRows =(int)(inputX.count/_inputLSize); //m
    cout << "inputRows:" << inputRows << endl;
    cout << "theta1(_t1):" ;
    debug(_t1);
    
    
    cout << "theta2(_t2):" ;
    debug(_t2);

    
    MD X = [self getMD:inputX rows:inputRows cols:(int)(_inputLSize)];
    // a1 = [ones(size(X,1),1),X];
    MD a1 = MD::Ones(inputRows ,_inputLSize + 1);
    a1.block(0, 1, X.rows(), X.cols()) = X;
    debug(a1);
//    cout << a1 <<endl;
    debug(_t1);
//    cout << _t1 <<endl;
    
    
    MD a2 = sigmoid(a1 * _t1.adjoint() );
    debug(a2);
//    cout << a2 <<endl;
    // a2 = [ones(size(a2',1),1),a2'];
    MD a2withBius = MD::Ones(inputRows, _hiddenLSize + 1);
    a2withBius.block(0, 1, a2.rows(), a2.cols()) = a2;
//    debug(a2withBius);
//    debug(_t2);
//    cout << "a2withBius:\n" << a2withBius<<endl;
//    cout << "_t2 :\n" << _t2 <<endl;
//    cout << "a2withBius * _t2 :\n" << a2withBius * (_t2.adjoint()) <<endl;

    MD a3  = sigmoid(a2withBius * (_t2.adjoint()));
    debug(a3);
//    cout << a3 <<endl;

    //[temp,p] = max(a3',[],2);
    MD persentage = a3.rowwise().maxCoeff();
    
    NSMutableArray<NSNumber*>* persentageArray = [NSMutableArray array];
    NSMutableArray<NSNumber*>* indexArray = [NSMutableArray array];
        
    for (int row = 0; row < inputRows; row ++) {
//        cout << a3.row(row) << endl;
        double* array = a3.row(row).data();
        double p = persentage(row,0);
        [persentageArray addObject:@(p)];

        for (int index = 0; index < _outputLSize; index++) {
            if (array[index] == p){
                [indexArray addObject:@(index) ];
                continue;
            }
        }
    }
    
    return @{@"index" : indexArray,@"persentage" : persentageArray};
    
}


- (void) costWithX:(NSArray<NSNumber*> * _Nonnull)inputX Y:(NSArray<NSNumber*> * _Nonnull) resultY {

    MD Y = MD::Ones(resultY.count / _outputLSize, _outputLSize);
    
}

@end