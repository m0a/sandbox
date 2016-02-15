//
//  Person.h
//  tryRealm
//
//  Created by m0a on 2014/12/26.
//  Copyright (c) 2014年 m0a. All rights reserved.
//

#import <Realm/Realm.h>

@interface Person : RLMObject
//<# Add properties here to define the model #>
@property NSString *name;
@property Person   *owner;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<Person>
RLM_ARRAY_TYPE(Person)
