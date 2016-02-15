//
//  TableViewController.swift
//  leaderboard_ios
//
//  Created by m0a on 2014/12/09.
//  Copyright (c) 2014年 m0a. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var players:M13OrderedDictionary!;
    var meteor:MeteorClient!;
    var selectedIndex = -1
    @IBOutlet weak var plusButton: UIBarButtonItem!
    @IBAction func clickPlusButton(sender: AnyObject) {
    
        if (self.selectedIndex < 0 || self.players == nil) {
            return
        }
        let obj: NSMutableDictionary = self.players[UInt(self.selectedIndex)] as NSMutableDictionary
        var _id = obj["_id"] as String
        var name = obj["name"] as String
        var score = obj["score"] as Int
        meteor.callMethodName("/players/update", parameters: [["_id" : _id ],["$inc":["score":5]]],
            responseCallback:
            { (NSDictionary response, NSErrorPointer error) in
                println(response)
                println(error)

            }
        )
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("testCell", forIndexPath: indexPath) as UITableViewCell
        
        let obj = self.players[UInt(indexPath.row)] as NSMutableDictionary?;
        var name = obj?["name"] as String
        var score = obj?["score"] as Int
        cell.textLabel?.text = "\(name) point: \(score)"
        return cell
    }
    
    override func tableView( tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (self.players == nil) {
            return 0
        }
        
        return Int(self.players.count())
    }
    
    required init(coder aDecoder: NSCoder) {
        self.meteor = (UIApplication.sharedApplication().delegate as AppDelegate).meteorClient
        super.init(coder: aDecoder)
//        self.meteor.addObserver(self, forKeyPath: "websocketReady", options: NSKeyValueObservingOptions.New, context: nil)
        
    }
//    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<()>) {
//        
////        if (keyPath == "websocketReady" && meteor.websocketReady) {
////        }
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.meteor.addObserver(self, forKeyPath: "websocketReady", options: NSKeyValueObservingOptions.New, context: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "didReceiveUpdate:", name: "added", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "didReceiveUpdate:", name: "changed", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "didReceiveUpdate:", name: "removed", object: nil)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    func didReceiveUpdate(notification:NSNotification){
        println("updated");
        if (self.meteor.collections.objectForKey("players") != nil){
            self.players = self.meteor.collections["players"]  as M13OrderedDictionary
            self.players = self.players.sortedByObjectsUsingComparator({ (objA, objB) -> NSComparisonResult in
                var scoreA = objA["score"] as Int
                var scoreB = objB["score"] as Int
                if (scoreA > scoreB ) {
                    return NSComparisonResult.OrderedAscending
                }
                if (scoreA < scoreB) {
                    return NSComparisonResult.OrderedDescending
                }
                return NSComparisonResult.OrderedSame
                
            })
            println(self.players)
            self.tableView.reloadData()
            self.tableView.selectRowAtIndexPath(NSIndexPath(forRow: self.selectedIndex, inSection: 0), animated: true, scrollPosition: UITableViewScrollPosition.Middle)
        }
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedIndex = indexPath.row
    }
    
}
