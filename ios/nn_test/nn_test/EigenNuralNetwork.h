//
//  EigenNuralNetwork.h
//  nn_test
//
//  Created by m0a on 2015/08/26.
//  Copyright © 2015年 m0a. All rights reserved.
//

#ifndef EigenNuralNetwork_h
#define EigenNuralNetwork_h

#import <Foundation/Foundation.h>



@interface EigenNuralNtwork : NSObject


- (nonnull instancetype) initWithInputLSize:(int) inputLSize
                        hiddenLSize:(int) hiddenLSize
                        outputLSize:(int) outputLSize;


@property NSArray<NSNumber*>* _Nonnull  theta1;
@property NSArray<NSNumber*>* _Nonnull theta2;

-(void) resetTheta;


//predict(theta1:la_object_t,theta2:la_obj ect_t,x :la_object_t)
-(NSDictionary<NSString*,NSArray*> *  _Nonnull)  predictwithX:(NSArray<NSNumber*> * _Nonnull) inputX;

-(void) Theta1memory;
-(void) Theta2memory;


@end


#endif /* EigenNuralNetwork_h */
