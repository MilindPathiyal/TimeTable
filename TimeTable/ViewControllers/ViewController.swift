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
        
        let imageData = NSData(contentsOfURL: NSBundle.mainBundle().URLForResource("5", withExtension: "gif")!)
        let imageGif = UIImage.gifWithData(imageData!)
        
        let imageView = UIImageView(image: imageGif)
        imageView.frame = CGRect(x:0.0, y:0.0, width:600.0, height:600.0)
        imageView.alpha = 1
        view.addSubview(imageView)
        
        self.view.bringSubviewToFront(self.collectionView!)
        
        self.collectionView!.backgroundColor = UIColor.clearColor()
        
        //performSegueWithIdentifier("showDayTasks", sender: nil)
        daysArray = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
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

