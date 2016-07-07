//
//  ViewController.swift
//  TimeTable
//
//  Created by Milind Pathiyal on 7/6/16.
//  Copyright © 2016 Milind Pathiyal. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    var daysArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //performSegueWithIdentifier("showDayTasks", sender: nil)        
        daysArray = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday", "[INSERT JOKE]"]
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as UICollectionViewCell
        
        
        var Button = cell.viewWithTag(1) as! UILabel
        Button.text = daysArray[indexPath.row]
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            if identifier == "showDayTasks" {
                let cell = sender as! UICollectionViewCell
                let indexPath = self.collectionView!.indexPathForCell(cell)
                let dayTasksViewController = segue.destinationViewController as! DayTableViewController
                dayTasksViewController.dayTitle = daysArray[(indexPath?.row)!]
            }
        }
    }
    
    @IBAction func unwindToViewController(segue: UIStoryboardSegue) {
        
        // for now, simply defining the method is sufficient.
        // we'll add code later
        
    }
}

