//
//  DayTableViewController.swift
//  TimeTable
//
//  Created by Alex Lee on 06/07/2016.
//  Copyright © 2016 Milind Pathiyal. All rights reserved.
//

import UIKit

class DayTableViewController: UITableViewController {
    
    var tasks: [DayTask] = []{
        // add property observer
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("launched")
        //tasks = RealmHelper.retrieveNotes()
    }
    
    // 1
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
        //return tasks.count
    }
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("listNotesTableViewCell", forIndexPath: indexPath)
        cell.textLabel?.text = "Yay - it's working!"
        
        //let cell = tableView.dequeueReusableCellWithIdentifier("listTasksTableViewCell", forIndexPath: indexPath) as! ListTasksTableViewCell
        
        //        cell.noteTitleLabel.text = "note's title"
        //        cell.noteModificationTimeLabel.text = "note's modification time"
        //        return cell
        
        //let row = indexPath.row
        
        //let task = tasks[row]
        
        //cell.noteTitleLabel.text = note.title
        
        //cell.noteModificationTimeLabel.text = note.modificationTime.convertToString()
        
        return cell
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // 1
        if let identifier = segue.identifier {
            // 2
            if identifier == "displayNote" {
                print("Table view cell tapped")
                
                //                let indexPath = tableView.indexPathForSelectedRow!
                //                let note = notes[indexPath.row]
                //                let displayNoteViewController = segue.destinationViewController as! DisplayNoteViewController
                //                displayNoteViewController.note = note
                
            } else if identifier == "addNote" {
                print("+ button tapped")
            }
        }
    }
    
    @IBAction func unwindToListNotesViewController(segue: UIStoryboardSegue) {
        
        // for now, simply defining the method is sufficient.
        // we'll add code later
        
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            //            notes.removeAtIndex(indexPath.row)
            //            tableView.reloadData()
            
            //RealmHelper.deleteNote(notes[indexPath.row])
            //notes = RealmHelper.retrieveNotes()
        }
    }
    
}
