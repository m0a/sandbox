//
//  KeyLogger.swift
//  keyLogger
//
//  Created by m0a on 2015/11/15.
//  Copyright © 2015年 m0a. All rights reserved.
//

import Foundation
import RealmSwift

class KeyLogger: Object {
    
    dynamic var id = 0
    dynamic var key :String = ""
    dynamic var typedTime :NSDate = NSDate()
    override static func primaryKey() -> String? {
        return "id"
    }
    
// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
}
