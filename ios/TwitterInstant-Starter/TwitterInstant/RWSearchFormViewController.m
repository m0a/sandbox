//
//  RWSearchFormViewController.m
//  TwitterInstant
//
//  Created by Colin Eberhardt on 02/12/2013.
//  Copyright (c) 2013 Colin Eberhardt. All rights reserved.
//

#import "RACEXTScope.h"
#import "RWSearchFormViewController.h"
#import "RWSearchResultsViewController.h"
#import <ReactiveCocoa.h>
#import <Accounts/Accounts.h>
#import <Social/Social.h>
#import "RWTweet.h"
#import "NSArray+LinqExtensions.h"

typedef NS_ENUM(NSInteger, RWTwitterInstantError ) {
    RWTwitterInstantErrorAccessDenied,
    RWTwitterInstantErrorNoTwitterAccount,
    RWTwitterInstantErrorInvalidResponse
};

static NSString * const RWTwitterInstantDomain = @"TwitterInstant";

@interface RWSearchFormViewController ()

@property (weak, nonatomic) IBOutlet UITextField *searchText;
@property (strong, nonatomic) RWSearchResultsViewController *resultsViewController;

@property (strong, nonatomic) ACAccountStore *accountStore;
@property (strong, nonatomic) ACAccountType *twitterAccountType;



@end

@implementation RWSearchFormViewController

-(BOOL) isValidSearchText:(NSString*) text
{
    return text.length > 3;
}


- (RACSignal *) requestAccessToTwitterSignal {
    
    NSError* accessError = [NSError errorWithDomain:RWTwitterInstantDomain
                                               code:RWTwitterInstantErrorAccessDenied
                                           userInfo:nil];
    
    
    @weakify(self)
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        @strongify(self)
        [self.accountStore requestAccessToAccountsWithType:self.twitterAccountType
                                                   options:nil
                                                completion:^(BOOL granted, NSError *error) {
            if (!granted) {
                [subscriber sendError:accessError];
            } else {
                [subscriber sendNext:nil];
                [subscriber sendCompleted];
            }
        }];
        return nil; //RACDisaposable;
    }];
}

- (SLRequest* ) requestForTwitterSearchWithText:(NSString*)text {
    NSURL* url = [NSURL URLWithString:@"https://api.twitter.com/1.1/search/tweets.json"];
    NSDictionary* params = @{@"q":text};
    SLRequest* reqest = [SLRequest requestForServiceType:SLServiceTypeTwitter
                                           requestMethod:SLRequestMethodGET
                                                     URL:url
                                              parameters:params];
    return reqest;
}

- (RACSignal* ) signalForSearchWithText:(NSString*) text {
    NSError* noAccountError = [NSError errorWithDomain:RWTwitterInstantDomain
                                                  code:RWTwitterInstantErrorNoTwitterAccount
                                              userInfo:nil];
    NSError* invalidResponseError = [NSError errorWithDomain:RWTwitterInstantDomain
                                                        code:RWTwitterInstantErrorInvalidResponse
                                                    userInfo:nil];
    
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        SLRequest* request = [self requestForTwitterSearchWithText:text];
        
        NSArray* twitterAccounts = [self.accountStore accountsWithAccountType:self.twitterAccountType];
        
        if (twitterAccounts.count == 0) {
            [subscriber sendError:noAccountError];
        } else {
            NSLog(@"twitter account count=%lu",(unsigned long)twitterAccounts.count);
            
            [request setAccount:[twitterAccounts lastObject]];
            
            [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
                if (urlResponse.statusCode == 200) {
                    NSDictionary* timelineData =
                    [NSJSONSerialization JSONObjectWithData:responseData
                                                    options:NSJSONReadingAllowFragments
                                                      error:nil];
                    [subscriber sendNext:timelineData];
                    [subscriber sendCompleted];
                
                } else {
                    [subscriber sendError:invalidResponseError];
                }
            }];
        }
        return nil;
    }];
}



- (void)viewDidLoad
{
  [super viewDidLoad];
  
  self.title = @"Twitter Instant";
  
  [self styleTextField:self.searchText];
  
  self.resultsViewController = self.splitViewController.viewControllers[1];
    
  //start rac code

    @weakify(self)
    [[self.searchText.rac_textSignal
      map:^id(NSString *text) {
          return [self isValidSearchText:text] ?
          [UIColor whiteColor] : [UIColor yellowColor];
      }]
     subscribeNext:^(UIColor *color) {
         @strongify(self)
         self.searchText.backgroundColor = color;
     }];
    
    
    self.accountStore = [ACAccountStore new];
    self.twitterAccountType = [self.accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    
    
    [[[[[[[self requestAccessToTwitterSignal]
     then:^RACSignal *{
         @strongify(self)
         return self.searchText.rac_textSignal;
     }]
     filter:^BOOL(NSString* text) {
         @strongify(self)
          return [self isValidSearchText:text];
     }]
     throttle:0.5]
     flattenMap:^RACStream *(NSString* text) {
         @strongify(self)
         return [self signalForSearchWithText:text];
     }]
     //deliverOnMainThread]
     deliverOn:[RACScheduler mainThreadScheduler]]
     subscribeNext:^(NSDictionary* jsonSearchResult) {
//         NSLog(@"%@",x);
         NSArray* statuses = jsonSearchResult[@"statuses"];
         NSArray* tweets = [statuses linq_select:^id(id tweet) {
             return [RWTweet tweetWithStatus:tweet];
         }];
         
         
         [self.resultsViewController displayTweets:tweets];
         
         
     } error:^(NSError *error) {
         NSLog(@"An error orrced: %@", error);
     }];
    
    
  
}

- (void)styleTextField:(UITextField *)textField {
  CALayer *textFieldLayer = textField.layer;
  textFieldLayer.borderColor = [UIColor grayColor].CGColor;
  textFieldLayer.borderWidth = 2.0f;
  textFieldLayer.cornerRadius = 0.0f;
}

@end
