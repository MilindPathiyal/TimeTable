//
//  TaskColorPickerViewController.swift
//  TimeTable
//
//  Created by Alex Lee on 07/07/2016.
//  Copyright © 2016 Milind Pathiyal. All rights reserved.
//

import UIKit

class TaskColorPickerViewController: UIViewController {
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    @IBOutlet weak var redButton: UIButton!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            let newEventViewController = segue.destinationViewController as! NewEventViewController
            if identifier == "red" {
                newEventViewController.color = "#FF6F6D"
            } else if identifier == "orange" {
                newEventViewController.color = "#FF9866"
            } else if identifier == "yellow" {
                newEventViewController.color = "#FFD774"
            } else if identifier == "green" {
                newEventViewController.color = "#B9FF8C"
            } else if identifier == "blue" {
                newEventViewController.color = "#A3CDFF"
            }
        }
    }
}
