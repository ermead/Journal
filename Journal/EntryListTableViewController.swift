//
//  EntryListTableViewController.swift
//  Journal
//
//  Created by Eric Mead on 10/15/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class EntryListTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {

    @IBOutlet weak var entryTableView: UITableView!
    
    @IBAction func addEntryButton(sender: AnyObject) {
    
        print("button pressed")
    
    }
    
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
    
        // I don't know about this..
        self.entryTableView.reloadData()

        // Do any additional setup after loading the view.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return EntryController.sharedController.entries.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("entryCell", forIndexPath: indexPath)
        
        let entries = EntryController.sharedController.entries
        
        cell.textLabel?.text = entries[indexPath.row].title
        
        return cell
        
    }

    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
        
            EntryController.sharedController.removeEntry(EntryController.sharedController.entries[indexPath.row])
            tableView.reloadData()
        } else if editingStyle == .Insert{
                //make insert here
            }

        
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        
        return true
    }
    
    @IBAction func unwindToEntryList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? EntryDetailViewController, entry = sourceViewController.newEntry {
            // Add a new entry.
            let newIndexPath = NSIndexPath(forRow: EntryController.sharedController.entries.count, inSection: 0)
            EntryController.sharedController.entries.append(entry)
            entryTableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
            print("Should have saved, but not working yet")
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toShowEntry" {
            
            if let detailViewController = segue.destinationViewController as? EntryDetailViewController {
                
                // Following line forces the view from Storyboard to load UI elements to make available for testing
                _ = detailViewController.view
                
                let indexPath = entryTableView.indexPathForSelectedRow
                
                if let selectedRow = indexPath?.row {
                    let entry = EntryController.sharedController.entries[selectedRow]
                    detailViewController.updateWithEntry(entry)
                }
            }
        }
    }

   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
