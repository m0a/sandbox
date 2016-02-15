//
//  RWTFlickerSearchViewModel.m
//  RWTFlickrSearch
//
//  Created by m0a on 2015/02/22.
//  Copyright (c) 2015年 Colin Eberhardt. All rights reserved.
//

#import "RWTFlickerSearchViewModel.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "RWTFlickerSearchResultsViewModel.h"

@interface RWTFlickerSearchViewModel ()

@property (nonatomic, weak) id<RWTViewModelServices> services;

@end

@implementation RWTFlickerSearchViewModel



- (instancetype) initWithServices:(id<RWTViewModelServices>) services {
    self = [super init];
    if (self) {
        _services = services;
        [self initialize];
    }
    return self;
}

- (void) initialize {
 
//    self.searchText = @"search text";
    self.title = @"Flicker Search";
    
    RACSignal* validSearchSignal =
    [[RACObserve(self, searchText)
    map:^id(NSString* text) {
         return @(text.length > 3);
     }]
     distinctUntilChanged];
    
    [validSearchSignal subscribeNext:^(id x) {
        NSLog(@"search text is valid %@",x);
    }];
    
    self.executeSearch =
        [[RACCommand alloc] initWithEnabled:validSearchSignal
                                signalBlock:^RACSignal *(id input) {
                                    NSLog(@"in RWTFlickerSearchViewModel.executeSearch->signalBlock:input=%@",input);
                                    
                                    return [self executeSearchSignal];
                                }];
    
}


- (RACSignal*) executeSearchSignal {
    return [[[self.services getFlickerSearchService]
            flickerSearchSignal:self.searchText]
            doNext:^(id result) {
                RWTFlickerSearchResultsViewModel* resultViewModel =
                [[RWTFlickerSearchResultsViewModel alloc]initWithSearchResults:result services:self.services];
                [self.services pushViewModel:resultViewModel];
            }];
}
@end



