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
    
    private let timeStampKey = "timestamp"
    private let titleKey = "title"
    private let textKey = "text"
    
    
    var timeStamp: NSDate
    var title: String
    var bodyText: String
    
    init (timeStamp:NSDate, title:String, bodyText:String){
        self.timeStamp = timeStamp
        self.title = title
        self.bodyText = bodyText
    }
    
    init?(dictionary: Dictionary<String, AnyObject>){
        
        guard let
        timeStamp = dictionary[timeStampKey] as? NSDate,
        title = dictionary[titleKey] as? String,
        bodyText = dictionary[textKey] as? String else {
                self.timeStamp = NSDate()
                self.title = ""
                self.bodyText = ""
                
                return nil
        }
        self.timeStamp = timeStamp
        self.title = title
        self.bodyText = bodyText
    }
    
    func dictionaryCopy()->Dictionary<String, AnyObject>{
        print("tried to copy dict")
        
        let dictionary = [
            timeStampKey : self.timeStamp,
            titleKey : self.title,
            textKey : self.bodyText
        ]
        return dictionary
        
    }
    
    
    
}

func == (lhs: Entry, rhs: Entry) -> Bool {
    
    return (rhs.title == lhs.title)
}

