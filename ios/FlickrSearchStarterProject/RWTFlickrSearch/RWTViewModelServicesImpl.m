//
//  RWTViewModelServicesImpl.m
//  RWTFlickrSearch
//
//  Created by m0a on 2015/02/23.
//  Copyright (c) 2015年 Colin Eberhardt. All rights reserved.
//

#import "RWTViewModelServicesImpl.h"
#import "RWTFlickerSearchImpl.h"
#import "RWTSearchResultsViewController.h"

@interface RWTViewModelServicesImpl ()

@property (strong,nonatomic) RWTFlickerSearchImpl* searchService;
@property (weak,nonatomic) UINavigationController* navigationController;

@end

@implementation RWTViewModelServicesImpl

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController
{
    self = [super init];
    if (self) {
        _searchService = [RWTFlickerSearchImpl new];
        _navigationController = navigationController;
    }
    return self;
}

- (id<RWTFlickerSearch>) getFlickerSearchService {
    return self.searchService;
}

-(void) pushViewModel:(id)viewModel {
    id viewController;
    if ([viewModel isKindOfClass:RWTFlickerSearchResultsViewModel.class]) {
        viewController = [[RWTSearchResultsViewController alloc]initWithViewModel:viewModel];
    } else {
        NSLog(@"an unknown viewModel was pushed!");
    }
    
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
