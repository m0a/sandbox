//
//  ViewController.swift
//  leaderboard_ios
//
//  Created by m0a on 2014/11/22.
//  Copyright (c) 2014年 m0a. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var players:M13OrderedDictionary!;
    var meteor:MeteorClient!;
    
    required init(coder aDecoder: NSCoder) {
        self.meteor=(UIApplication.sharedApplication().delegate as AppDelegate).meteorClient
//        self.players=self.meteor.collections["players"] as M13MutableOrderedDictionary
        super.init(coder: aDecoder)

        self.meteor.addObserver(self, forKeyPath: "websocketReady", options: NSKeyValueObservingOptions.New, context: nil)

    }
    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<()>) {
        
        if (keyPath == "websocketReady" && meteor.websocketReady) {
            println("reseting, but not")
            //self.players=self.meteor.collections["players"] as M13MutableOrderedDictionary
            println(self.meteor.collections)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.meteor.addObserver(self, forKeyPath: "websocketReady", options: NSKeyValueObservingOptions.New, context: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "didReceiveUpdate:", name: "added", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "didReceiveUpdate:", name: "removed", object: nil)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    func didReceiveUpdate(notification:NSNotification){
        println("updated");
        if (self.meteor.collections.objectForKey("players") != nil){
            self.players = self.meteor.collections["players"]  as M13OrderedDictionary
            println(self.players)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

