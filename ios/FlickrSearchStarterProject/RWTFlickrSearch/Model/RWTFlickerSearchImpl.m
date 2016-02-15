//
//  RWTFlickerSearchImpl.m
//  RWTFlickrSearch
//
//  Created by m0a on 2015/02/23.
//  Copyright (c) 2015年 Colin Eberhardt. All rights reserved.
//

#import "RWTFlickerSearchImpl.h"
#import "RWTFlickerPhoto.h"
#import "RWTFlickerSearchResults.h"
#import <objectiveflickr/ObjectiveFlickr.h>
#import <LinqToObjectiveC/NSArray+LinqExtensions.h>

@interface RWTFlickerSearchImpl () <OFFlickrAPIRequestDelegate>

@property (strong, nonatomic) NSMutableSet* requests;
@property (strong, nonatomic) OFFlickrAPIContext* flickerContext;
@end

@implementation RWTFlickerSearchImpl



- (instancetype)init
{
    self = [super init];
    if (self) {
        NSString* OFSampleAppAPIKey = @"bb1579563be15aab6cf161392bfa6e63";
        NSString* OFSampleAppAPISharedSecret  = @"455797230ccdbf88";
        _flickerContext = [[OFFlickrAPIContext alloc] initWithAPIKey:OFSampleAppAPIKey
                                                        sharedSecret:OFSampleAppAPISharedSecret];
        _requests = [NSMutableSet new];
        
    }
    return self;
}


- (RACSignal*) flickerSearchSignal:(NSString*) searchString {

//    NSLog(@"in flickerSearchSignal: searchString=%@",searchString);
    
    return [self signalFromAPIMethod:@"flickr.photos.search"
                           arguments:@{@"text": searchString,
                                       @"sort": @"interestingness-desc"}
                           transform:^id(NSDictionary *response) {
                               
//                               NSLog(@"response=%@",response);
       RWTFlickerSearchResults * results = [RWTFlickerSearchResults new];
       results.searchString = searchString;
       results.totalResults = [[response valueForKeyPath:@"photos.total"] integerValue];
       
       
       NSArray* photos = [response valueForKeyPath:@"photos.photo"];
       results.photos = [photos linq_select:^id(NSDictionary* jsonPhoto) {
           RWTFlickerPhoto* photo = [RWTFlickerPhoto new];
           photo.title = [jsonPhoto objectForKey:@"title"];
           photo.identifer = [jsonPhoto objectForKey:@"id"];
           photo.url = [self.flickerContext photoSourceURLFromDictionary:jsonPhoto
                                                                    size:OFFlickrSmallSize];
           return photo;
       }];
       return results;
   }];
}

- (RACSignal*) signalFromAPIMethod:(NSString*) method
                          arguments:(NSDictionary*) args
                         transform:(id (^)(NSDictionary* response)) block  {
    
    NSLog(@"in signalFromAPIMethod:method=%@,args:%@",method,args);
    
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
       
        //2. Create a Flicker request object
        OFFlickrAPIRequest* flickerRequest =
        [[OFFlickrAPIRequest alloc] initWithAPIContext:self.flickerContext];
        
        flickerRequest.delegate = self;
    
        [self.requests addObject:flickerRequest];
        
        // 3. creste s signal from the delegate method
        RACSignal* successSignal =
        [self rac_signalForSelector:@selector(flickrAPIRequest:didCompleteWithResponse:) fromProtocol:@protocol(OFFlickrAPIRequestDelegate)];
        
        
        //4. handle the response
        
        [[[successSignal
        map:^id(RACTuple* tuple) {
            return tuple.second;
        }]
        map:block ]
        subscribeNext:^(id x) {
            [subscriber sendNext:x];
            [subscriber sendCompleted];
        }];
        
        //5. Make request
        [flickerRequest callAPIMethodWithGET:method
                                   arguments:args];
        
        // 6. when we are done , remove the refrence to this request
        return [RACDisposable disposableWithBlock:^{
            [self.requests removeObject:flickerRequest];
        }];
        
    }];
}



@end
