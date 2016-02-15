//
//  ViewController.m
//  tryRealm
//
//  Created by m0a on 2014/12/26.
//  Copyright (c) 2014年 m0a. All rights reserved.
//

#import "ViewController.h"
#import "models/Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Person *auther = [Person new];
    auther.name = @"David Foster Wallace";
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm addObject:auther];
    [realm commitWriteTransaction];
    
    
    [realm beginWriteTransaction];
    auther.name = @"akiko abe";
    [realm commitWriteTransaction];
    
    
    RLMResults* persons = [Person allObjects];
    NSLog(@"%@",persons);
    
    
    


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
