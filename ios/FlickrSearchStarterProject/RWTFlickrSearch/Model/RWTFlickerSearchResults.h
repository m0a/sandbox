//
//  RWTFlickerSearchResults.h
//  RWTFlickrSearch
//
//  Created by m0a on 2015/02/24.
//  Copyright (c) 2015年 Colin Eberhardt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RWTFlickerSearchResults : NSObject

@property (strong, nonatomic) NSString* searchString;
@property (strong, nonatomic) NSArray* photos;
@property (nonatomic) NSUInteger totalResults;

@end
