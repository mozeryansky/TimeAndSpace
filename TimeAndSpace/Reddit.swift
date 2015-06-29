//
//  Reddit.swift
//  TimeAndSpace
//
//  Created by Ozeryansky, Michael on 6/28/15.
//  Copyright (c) 2015 Michael Ozeryansky. All rights reserved.
//

import Foundation
import Alamofire

class Reddit {

    let redditJSON = "https://www.reddit.com/r/EarthPorn+SpacePorn+skyporn+seaporn+DesertPorn+WinterPorn+AutumnPorn+SpringPorn+BeachPorn+LakePorn.json"
    
    var after = ""
    
    // get
    func addNewImages() {
        // send request
        Alamofire.request(.GET, redditJSON, parameters: ["limit": 50, "after": after])
            .responseJSON() { (request, response, data, error) in
                //
                if error != nil {
                    println("Reddit::addImages error, \(error)")
                    return
                }
                
                if let JSON : AnyObject = data {
                    self.parseRedditJSON(JSON);
                } else {
                    println("Reddit::addImages could not get JSON")
                }
        }
    }
    
    private func parseRedditJSON(JSON : AnyObject) {
        
        var imageURLs = [String]()
        
        // convert to dictionary
        if let data = JSON["data"] as? NSDictionary {
            // update after
            if let after = data["after"] as? String {
                self.after = after
                
            } else {
                println("Reddit::parseRedditJSON could not get after, for data: \(data)")
            }
            
            // get children
            if let children = data["children"] as? [NSDictionary] {
                // for each children 
                for child : NSDictionary in children {
                    // get image url
                    if let images = child.valueForKeyPath("data.preview.images") as? [NSDictionary] {
                        // get url
                        if let url = images.first?.valueForKeyPath("source.url") as? String {
                            imageURLs.append(url)
                        } else {
                            println("Reddit::parseRedditJSON could not get image url for images: \(images)")
                        }
                        
                    } else {
                        println("Reddit::parseRedditJSON could not get images for url for child: \(child)")
                    }
                }
                
            } else {
                println("Reddit::parseRedditJSON could not get children for data: \(data)")
            }
        }
        
        // add URLs to firebase
        addUrls(imageURLs)
    }
    
    private func addUrls(urls : [String]) {
        // add all urls to Firebase
        println(urls)
    }
}