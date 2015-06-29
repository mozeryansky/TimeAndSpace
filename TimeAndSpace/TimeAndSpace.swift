//
//  TimeAndSpace.swift
//  TimeAndSpace
//
//  Created by Ozeryansky, Michael on 6/28/15.
//  Copyright (c) 2015 Michael Ozeryansky. All rights reserved.
//

import Foundation

let kFirebaseURL = "https://time-and-space.firebaseio.com"

let firebaseRef = Firebase(url: kFirebaseURL)

class TimeAndSpace {
    
    // get user UUID or create one
    func userUUID() -> String {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        var uuid = defaults.objectForKey("uuid") as? String
        
        if uuid == nil {
            uuid = NSUUID().UUIDString
            
            defaults.setObject(uuid, forKey: "uuid")
        }
        
        return uuid!
    }
}