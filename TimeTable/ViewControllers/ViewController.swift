//
//  ViewController.swift
//  TimeTable
//
//  Created by Milind Pathiyal on 7/6/16.
//  Copyright © 2016 Milind Pathiyal. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {

    var Array = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //performSegueWithIdentifier("showDayTasks", sender: nil)

        Array = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday", "[INSERT JOKE]"]

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as UICollectionViewCell
        
        
       var Button = cell.viewWithTag(1) as! UILabel
       Button.text = Array[indexPath.row]
        return cell
    }

    
    @IBAction func unwindToListNotesViewController(segue: UIStoryboardSegue) {
        if let identifier = segue.identifier {
            if identifier == "Back" {
                print("Back")
            }
        }
        
    }

}

