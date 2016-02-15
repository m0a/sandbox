//
//  RWTFlickerSearchResultsViewModel.m
//  RWTFlickrSearch
//
//  Created by m0a on 2015/02/25.
//  Copyright (c) 2015年 Colin Eberhardt. All rights reserved.
//

#import "RWTFlickerSearchResultsViewModel.h"

@implementation RWTFlickerSearchResultsViewModel

- (instancetype)initWithSearchResults:(RWTFlickerSearchResults *)results services:(id<RWTViewModelServices>)services
{
    self = [super init];
    if (self) {
        _title = results.searchString;
        _searchResults = results.photos;
    }
    return self;
}
@end


