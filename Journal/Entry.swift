//
//  Entry.swift
//  Journal
//
//  Created by Eric Mead on 10/15/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

//Add a new Entry.swift file and define a new Entry class
//Add properties for timestamp, title, and body text
//Add a memberwise initializer that takes parameters for each property
//note: Consider setting a default parameter value for timestamp.

class Entry: Equatable {
    
    let timeStamp: NSTimeInterval
    let title: String
    let bodyText: String
    
    init (timeStamp:NSTimeInterval, title:String, bodyText:String){
        self.timeStamp = timeStamp
        self.title = title
        self.bodyText = bodyText
    }
}

func == (lhs: Entry, rhs: Entry) -> Bool {
    
    return (rhs.title == lhs.title)
}





