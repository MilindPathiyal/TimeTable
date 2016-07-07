//
//  DayTask.swift
//  TimeTable
//
//  Created by Alex Lee on 06/07/2016.
//  Copyright © 2016 Milind Pathiyal. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class DayTask: Object {
    dynamic var day = Day.Monday.rawValue
    var dayEnum: Day {
        get {
            return Day(rawValue: day)!
        }
        set {
            day = newValue.rawValue
        }
    }
    dynamic var isChecked = false
    dynamic var title = ""
    dynamic var startTime = NSDate()
    dynamic var endTime = NSDate()
    dynamic var color = ""
}

enum Day: String {
    case Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
}