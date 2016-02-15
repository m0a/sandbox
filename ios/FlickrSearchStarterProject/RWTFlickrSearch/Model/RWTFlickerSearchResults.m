//
//  RWTFlickerSearchResults.m
//  RWTFlickrSearch
//
//  Created by m0a on 2015/02/24.
//  Copyright (c) 2015年 Colin Eberhardt. All rights reserved.
//

#import "RWTFlickerSearchResults.h"

@implementation RWTFlickerSearchResults


- (NSString* ) description {
    return [NSString stringWithFormat:@"searchString=%@,totalresults=%lU, photos=%@",
            self.searchString, self.totalResults ,self.photos];
    
}

@end
