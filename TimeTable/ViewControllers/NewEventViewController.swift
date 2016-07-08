//
//  NewEventViewController.swift
//  TimeTable
//
//  Created by Milind Pathiyal on 7/6/16.
//  Copyright © 2016 Milind Pathiyal. All rights reserved.
//

import UIKit
import RealmSwift

class NewEventViewController: UIViewController {
    
    @IBOutlet weak var taskTitleTextField: UITextField!
    @IBOutlet weak var taskStartTimePicker: UIDatePicker!
    @IBOutlet weak var taskEndTimePicker: UIDatePicker!
    
    var dayEnum = Day.Monday
    var color = ""
    
    @IBAction func didEndOnExit(sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func textFieldDidEndEditing(sender: UITextField) {
        
        sender.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Save" {
            let dayTableViewController = segue.destinationViewController as! DayTableViewController
            let formatter = NSDateFormatter();
            formatter.dateFormat = "HH:mm";
            
            let task = DayTask()
            task.title = taskTitleTextField.text ?? ""
            task.startTime = taskStartTimePicker.date
            task.endTime = taskEndTimePicker.date
            task.dayEnum = dayEnum
            task.color = color
            RealmHelper.addTask(task)
            dayTableViewController.tasks = RealmHelper.retrieveTask(dayEnum)
        }
    }
    
    @IBAction func unwindToNewEventViewController(segue: UIStoryboardSegue) {
        
    }
    
    
}
