//: Playground - noun: a place where people can play

import Foundation
import Cocoa


var str = "Hello, playground"


typealias CallbakFunc = (fn:(Void) -> Void,uuid:String)
func createUUIDString() -> String {
    let uuid = CFUUIDCreate(nil)
    let uuidString = CFUUIDCreateString(nil, uuid)
    return uuidString! as String
}

func testEqualsfunc() {
    
    var a:CallbakFunc = (fn:{},uuid:createUUIDString())
    var b:CallbakFunc = (fn:{},uuid:createUUIDString())
    var c:CallbakFunc = (fn:{},uuid:createUUIDString())
    
    var list:[CallbakFunc] = []
    
    list.append(a)
    list.append(b)
    list.append(c)
    
    for x  in list {
        if x.uuid  == b.uuid { // Swift compile Error : Binary operator '==' cannot be applied to operands of type '() -> ()' and 'CallbakFunc'
            println("b is hit")
        }
    }
}

testEqualsfunc()
