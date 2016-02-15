//
//  RWTFlickerSearchResultsViewModel.h
//  RWTFlickrSearch
//
//  Created by m0a on 2015/02/25.
//  Copyright (c) 2015年 Colin Eberhardt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RWTFlickerSearchResults.h"
#import "RWTViewModelServices.h"

@interface RWTFlickerSearchResultsViewModel : NSObject

- (instancetype) initWithSearchResults:(RWTFlickerSearchResults* ) results services: (id<RWTViewModelServices>) services;

@property (strong, nonatomic) NSString* title;
@property (strong, nonatomic) NSArray* searchResults;

@end
