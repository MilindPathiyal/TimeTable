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
        print()
        tempDayEnum = Day(rawValue:dayTitle)!
        tasks = RealmHelper.retrieveTask(tempDayEnum)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            let newEventViewController = segue.destinationViewController as! NewEventViewController
            if identifier == "addTask" {
                newEventViewController.dayEnum = tempDayEnum
            }
        }
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
        cell.taskStartTimeLabel.text = task.startTime.convertToString()
        
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            RealmHelper.deleteTask(tasks[indexPath.row])
            tasks = RealmHelper.retrieveTask(tempDayEnum)
        }
    }
}