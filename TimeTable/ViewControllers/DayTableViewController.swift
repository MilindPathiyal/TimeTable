//
//  DayTableViewController.swift
//  TimeTable
//
//  Created by Alex Lee on 06/07/2016.
//  Copyright © 2016 Milind Pathiyal. All rights reserved.
//

import UIKit
import RealmSwift

class DayTableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var dayTitle = ""
    var tempDayEnum = Day(rawValue:"Monday")!
    var tasks: Results<DayTask>!{
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = dayTitle
        tempDayEnum = Day(rawValue:dayTitle)!
        tasks = RealmHelper.retrieveTask(tempDayEnum)
        print(tasks.count)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            if identifier == "addTask" {
                let newEventViewController = segue.destinationViewController as! NewEventViewController
                newEventViewController.dayEnum = tempDayEnum
            } 
        }
    }
    
    @IBAction func unwindToDayTableViewController(segue: UIStoryboardSegue) {
        
        // for now, simply defining the method is sufficient.
        // we'll add code later
        
    }
}

extension DayTableViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("listTasksTableViewCell", forIndexPath: indexPath) as! ListTasksTableViewCell
        
        //cell.taskTitleLabel.text = "Task"
        cell.taskCheckbox.animationDuration = NSTimeInterval(Float(0.3))
        
        let row = indexPath.row
        
        let task = tasks[row]
        
        cell.taskTitleLabel.text = task.title
        
        if task.isChecked{
            cell.taskCheckbox.setCheckState(.Checked, animated: true)
        } else {
            cell.taskCheckbox.setCheckState(.Unchecked, animated: true)
        }
        let formatter = NSDateFormatter();
        formatter.dateFormat = "HH:mm";
        cell.taskStartTimeLabel.text = formatter.stringFromDate(task.startTime)
        
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            RealmHelper.deleteTask(tasks[indexPath.row])
            tasks = RealmHelper.retrieveTask(tempDayEnum)
        }
    }
}