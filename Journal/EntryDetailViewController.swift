//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Eric Mead on 10/15/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var bodyTextOutlet: UITextView!
    
    @IBAction func clearButton(sender: AnyObject) {
        
        titleTextField.text? = ""
        bodyTextOutlet.text? = ""
    }
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var newEntry: Entry?
    
    @IBAction func saveButtontapped(sender: AnyObject) {
    
        if let entry = self.newEntry {
            entry.title = self.titleTextField.text!
            entry.bodyText = self.bodyTextOutlet.text
            entry.timeStamp = NSDate()
        } else {
            let newEntry = Entry(timeStamp: NSDate(), title: self.titleTextField.text!, bodyText: self.bodyTextOutlet.text)
            EntryController.sharedController.addEntry(newEntry)
            self.newEntry = newEntry
        }
        
        self.navigationController?.popViewControllerAnimated(true)
    
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.delegate = self
    
        
        navigationItem.title = "Update"
        
        // Do any additional setup after loading the view.
    }

    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
    
        textField.resignFirstResponder()
        
        return true
    }
    
    // This method lets you configure a view controller before it's presented.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender {
            let title = titleTextField.text ?? ""
            let bodyText = bodyTextOutlet.text
            let timeStamp = NSDate()
            let tableView = 
            
            // Set the entry to be passed to EntryListTableViewController after the unwind segue.
            newEntry = Entry(timeStamp: timeStamp, title: title, bodyText: bodyText)
        }
    }
    
    func updateWithEntry(entry: Entry) {
        
        self.newEntry = entry
        
        self.titleTextField.text = entry.title
        self.bodyTextOutlet.text = entry.bodyText    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
