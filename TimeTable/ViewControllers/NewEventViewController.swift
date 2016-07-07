//
//  NewEventViewController.swift
//  TimeTable
//
//  Created by Milind Pathiyal on 7/6/16.
//  Copyright © 2016 Milind Pathiyal. All rights reserved.
//

import UIKit

class NewEventViewController: UIViewController {

    @IBOutlet weak var taskTitleTextField: UITextField!
    @IBOutlet weak var taskStartTimePicker: UIDatePicker!
    @IBOutlet weak var taskStopTimePicker: UIDatePicker!
    
    var dayEnum = Day.Monday;
    
    @IBAction func didEndOnExit(sender: UITextField) {
        sender.resignFirstResponder()
    }
    @IBAction func textFieldDidEndEditing(sender: UITextField) {
        
        sender.resignFirstResponder()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dayTableViewController = segue.destinationViewController as! DayTableViewController
        if segue.identifier == "Save" {
            //            if let note = note {
            //                // 1
            //                note.title = noteTitleTextField.text ?? ""
            //                note.content = noteContentTextView.text ?? ""
            //                // 2
            //                listNotesTableViewController.tableView.reloadData()
            //            } else {
            //                // 3
            //                let newNote = Note()
            //                newNote.title = noteTitleTextField.text ?? ""
            //                newNote.content = noteContentTextView.text ?? ""
            //                newNote.modificationTime = NSDate()
            //                listNotesTableViewController.notes.append(newNote)
            //            }
            
            // if note exists, update title and content

                // if note does not exist, create new note
                let task = DayTask()
                task.title = taskTitleTextField.text ?? ""
                task.startTime = taskStartTimePicker. ?? ""
                task.endTime = taskStartTimePicker.text ?? ""
                task.dayEnum = dayEnum
                RealmHelper.addTask(task)
            dayTableViewController.tasks = RealmHelper.retrieveTask()
        }
    }

}
