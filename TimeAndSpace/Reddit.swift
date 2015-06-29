//
//  Reddit.swift
//  TimeAndSpace
//
//  Created by Ozeryansky, Michael on 6/28/15.
//  Copyright (c) 2015 Michael Ozeryansky. All rights reserved.
//

import Foundation
//import Alamofire

class Reddit {

    let redditJSON = "https://www.reddit.com/r/EarthPorn+SpacePorn+skyporn+seaporn+DesertPorn+WinterPorn+AutumnPorn+SpringPorn+BeachPorn+LakePorn.json"
    
    var after = ""
    
    // get
    func addImages() {
        // send request
        /*
        Alamofire.request(.GET, redditJSON, parameters: ["limit": 50, "after": after])
            .response { (request, response, data, error) in
                //
                println(request)
                println(response)
                println(error)
        }
        */
    }
}