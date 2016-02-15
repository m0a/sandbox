//
//  Person.swift
//  realmSandbox
//
//  Created by m0a on 2015/06/27.
//  Copyright (c) 2015年 m0a. All rights reserved.
//

import RealmSwift

// Dog model
class Dog: Object {
    dynamic var name = ""
    dynamic var owner: Person? // Can be optional
}

// Person model
class Person: Object {
    dynamic var name = ""
    dynamic var birthdate = NSDate(timeIntervalSince1970: 1)
    let dogs = List<Dog>()
}
