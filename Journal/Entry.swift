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
    
    private let timeStampKey = "timeStamp"
    private let titleKey = "title"
    private let textKey = "bodyText"
    
    
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
        let dictionary = [
            timeStampKey : self.timeStamp,
            titleKey : self.title,
            textKey : self.textKey
        ]
        return dictionary
        
    }
    
    
    
}

func == (lhs: Entry, rhs: Entry) -> Bool {
    
    return (rhs.title == lhs.title)
}



//
//
//import Foundation
//
//class Entry: Equatable {
//    
//    private let timestampKey = "timestamp"
//    private let titleKey = "title"
//    private let textKey = "text"
//    
//    var timestamp: NSDate
//    var title: String
//    var text: String
//    
//    init(timestamp: NSDate = NSDate(), title: String, text: String) {
//        
//        self.timestamp = timestamp
//        self.title = title
//        self.text = text
//    }
//    
//    init?(dictionary: Dictionary<String, AnyObject>) {
//        guard let timestamp = dictionary[timestampKey] as? NSDate,
//            let title = dictionary[titleKey] as? String,
//            let text = dictionary[textKey] as? String else {
//                
//                // sets values for stored properties due to requirement as of Swift 2.0
//                self.timestamp = NSDate()
//                self.title = ""
//                self.text = ""
//                
//                return nil
//        }
//        
//        self.timestamp = timestamp
//        self.title = title
//        self.text = text
//        
//    }
//    
//    func dictionaryCopy() -> Dictionary<String, AnyObject> {
//        
//        let dictionary = [
//            timestampKey : self.timestamp,
//            titleKey : self.title,
//            textKey : self.text
//        ]
//        
//        return dictionary
//    }
//    
//}
//
//func == (lhs: Entry, rhs: Entry) -> Bool {
//    return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
//}