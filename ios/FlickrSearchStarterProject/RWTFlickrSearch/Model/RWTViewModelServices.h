//
//  RWTModelServices.h
//  RWTFlickrSearch
//
//  Created by m0a on 2015/02/23.
//  Copyright (c) 2015年 Colin Eberhardt. All rights reserved.
//

#import "RWTFlickerSearch.h"

@protocol RWTViewModelServices <NSObject>

-(id<RWTFlickerSearch>) getFlickerSearchService;
-(void) pushViewModel:(id)viewModel;

@end