//
//  RWTViewModelServicesImpl.h
//  RWTFlickrSearch
//
//  Created by m0a on 2015/02/23.
//  Copyright (c) 2015年 Colin Eberhardt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RWTViewModelServices.h"
#import "RWTSearchResultsViewController.h"

@interface RWTViewModelServicesImpl : NSObject <RWTViewModelServices>

- (instancetype) initWithNavigationController:(UINavigationController*) navigationController;

@end
