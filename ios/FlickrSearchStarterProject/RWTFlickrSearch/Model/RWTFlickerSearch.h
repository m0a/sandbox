//
//  RWTFlickerSearch.h
//  RWTFlickrSearch
//
//  Created by m0a on 2015/02/23.
//  Copyright (c) 2015年 Colin Eberhardt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
@protocol RWTFlickerSearch <NSObject>

- (RACSignal*) flickerSearchSignal:(NSString*) searchString;

@end