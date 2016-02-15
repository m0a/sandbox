//
//  RWTFlickerSearchViewModel.h
//  RWTFlickrSearch
//
//  Created by m0a on 2015/02/22.
//  Copyright (c) 2015年 Colin Eberhardt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "RWTViewModelServices.h"


@interface RWTFlickerSearchViewModel : NSObject

@property (strong, nonatomic) NSString* searchText;
@property (strong, nonatomic) NSString* title;

@property (strong, nonatomic) RACCommand* executeSearch;

- (instancetype) initWithServices:(id<RWTViewModelServices>) services;

@end
