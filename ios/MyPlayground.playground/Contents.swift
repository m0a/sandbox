//: Playground - noun: a place where people can play

import UIKit
import AVFoundation


class Something {
    func someSyncHandler( handler: Void -> Void) {
        print("in someSyncHandler")
        handler()
    }
    
    
    func someTask() {
        someSyncHandler {
            // メソッドのスコープよりもハンドラ関数オブジェクトのライフサイクルは長くない
            // したがってインスタンスを関数オブジェクトにキャプチャしないため、
            // `self` を明示的にしなくてよい
            let arr = self.duplicateAndDoubled(1)
            print(arr)
        }
        
    }
    
    func duplicateAndDoubled(elem: Int) -> [Int] {
        print("run duplicateAndDoubled")
        return [elem * 2, elem * 2]
    }
}

let a = Something()

a.someTask()


class Something2 {
    
    func someSyncHandler(@noescape handler: Void -> Void) {
        handler()
    }
 
    
    func someTask() {
        someSyncHandler {
            // メソッドのスコープよりもハンドラ関数オブジェクトのライフサイクルは長くない
            // したがってインスタンスを関数オブジェクトにキャプチャしないため、
            // `self` を明示的にしなくてよい
            let arr = duplicateAndDoubled(1)
            print(arr)
        }
        
    }
    
    func duplicateAndDoubled(elem: Int) -> [Int] {
        return [elem * 2, elem * 2]
    }
    
}

let b = Something2()
b.someTask()
