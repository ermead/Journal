//
//  EntryController.swift
//  Journal
//
//  Created by Eric Mead on 10/15/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation
import UIKit
/*
Create a model object controller called EntryController that will manage adding, reading, updating, and removing entries. We will follow the shared instance design pattern because we want one consistent source of truth for our entry objects that are held on the controller.

Add a new EntryController.swift file and define a new EntryController class inside.
Add an entries Array property, set it to empty in the initializer
Create a addEntry(entry: Entry) function that adds the entry parameter to the entries array
Create a removeEntry(entry: Entry) function that removes the entry from the entries array
note: There is no 'removeObject' function on arrays. You will need to find the index of the object and then remove the object at that index.
note: You will face a compiler error because we have not given the Entry class a way to find equal objects. You will resolve the error by implementing the Equatable protocol in the next step.
Create a sharedController property as a shared instance.
note: Review the syntax for creating shared instance properties
*/

class EntryController {
    
    private let entriesKey = "entries"
    
    static let sharedController = EntryController()
    
    var entries:[Entry] = [Entry(timeStamp: NSDate(), title: "Hello", bodyText: "yes")]
    
    init() {
        
        self.entries = []
        
        self.loadFromPersistentStorage()
    }
    
    func addEntry(entryParameter: Entry){
        
        entries.append(entryParameter)
        self.saveToPersistentStorage()
        
    }
    
    func removeEntry(entryParameter: Entry){
       
        let index = self.entries.indexOf(entryParameter)
        
        if let entryIndex = index {
            
            self.entries.removeAtIndex(entryIndex)
            
        }
        
    }
    
    func loadFromPersistentStorage() {
        
        let entryDictionariesFromDefaults = NSUserDefaults.standardUserDefaults().objectForKey(entriesKey) as? [Dictionary<String, AnyObject>]
        
        if let entryDictionaries = entryDictionariesFromDefaults {
            
            self.entries = entryDictionaries.map({Entry(dictionary: $0)!})
        }
    }
    
    func saveToPersistentStorage() {
        
        let entryDictionaries = self.entries.map({$0.dictionaryCopy()})
        
        NSUserDefaults.standardUserDefaults().setObject(entryDictionaries, forKey: entriesKey)
    }
    
}

